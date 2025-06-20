// Holy Island Database Administrator - Client-side JavaScript
// Minimal JavaScript for essential interactions only

document.addEventListener('DOMContentLoaded', function() {
    // Initialize tooltips if Bootstrap tooltips are used
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Auto-dismiss alerts after 5 seconds
    const alerts = document.querySelectorAll('.alert:not(.alert-permanent)');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            const bsAlert = new bootstrap.Alert(alert);
            if (bsAlert) {
                bsAlert.close();
            }
        }, 5000);
    });

    // Confirm deletion actions
    const deleteButtons = document.querySelectorAll('form[action*="delete"] button[type="submit"]');
    deleteButtons.forEach(function(button) {
        button.addEventListener('click', function(e) {
            if (!confirm('Are you sure you want to delete this record? This action cannot be undone.')) {
                e.preventDefault();
                return false;
            }
        });
    });

    // Refresh logs content when Logs tab is clicked
    const logsTab = document.getElementById('logs-tab');
    if (logsTab) {
        logsTab.addEventListener('click', function() {
            // Allow the tab to switch first, then refresh logs content
            setTimeout(function() {
                refreshLogsContent();
            }, 100);
        });
    }

    // Form validation enhancement
    const forms = document.querySelectorAll('form');
    forms.forEach(function(form) {
        form.addEventListener('submit', function(e) {
            if (!form.checkValidity()) {
                e.preventDefault();
                e.stopPropagation();
                
                // Focus on first invalid field
                const firstInvalid = form.querySelector(':invalid');
                if (firstInvalid) {
                    firstInvalid.focus();
                    firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
            form.classList.add('was-validated');
        });
    });

    // Auto-refresh status indicators every 30 seconds on dashboard
    if (window.location.pathname === '/dashboard' || window.location.pathname === '/') {
        setInterval(function() {
            refreshStatusIndicators();
        }, 30000);
    }

    // Mobile-friendly table scroll indicator
    const tableContainers = document.querySelectorAll('.table-responsive');
    tableContainers.forEach(function(container) {
        const table = container.querySelector('table');
        if (table && table.scrollWidth > container.clientWidth) {
            container.classList.add('has-scroll');
            
            // Add scroll indicator
            const indicator = document.createElement('div');
            indicator.className = 'scroll-indicator';
            indicator.innerHTML = '<i class="fas fa-arrows-alt-h"></i> Scroll to see more';
            container.appendChild(indicator);
        }
    });
});

// Utility functions
function showAlert(type, message, permanent = false) {
    const alertClass = type === 'error' ? 'alert-danger' : 
                      type === 'warning' ? 'alert-warning' : 
                      type === 'info' ? 'alert-info' : 'alert-success';
    
    const permanentClass = permanent ? 'alert-permanent' : '';
    
    const alertHtml = `
        <div class="alert ${alertClass} ${permanentClass} alert-dismissible fade show" role="alert">
            <i class="fas fa-${type === 'error' ? 'exclamation-triangle' : 
                              type === 'warning' ? 'exclamation-circle' : 
                              type === 'info' ? 'info-circle' : 'check-circle'} me-2"></i>
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    `;
    
    const container = document.querySelector('main .container-fluid');
    if (container) {
        container.insertAdjacentHTML('afterbegin', alertHtml);
        
        // Auto-dismiss after 5 seconds if not permanent
        if (!permanent) {
            setTimeout(function() {
                const alert = container.querySelector('.alert:first-child');
                if (alert && !alert.classList.contains('alert-permanent')) {
                    const bsAlert = new bootstrap.Alert(alert);
                    if (bsAlert) {
                        bsAlert.close();
                    }
                }
            }, 5000);
        }
    }
}

function showLoadingButton(button, text = 'Loading...') {
    if (button) {
        button.setAttribute('data-original-text', button.innerHTML);
        button.disabled = true;
        button.innerHTML = `<i class="fas fa-spinner fa-spin me-1"></i>${text}`;
    }
}

function hideLoadingButton(button) {
    if (button) {
        const originalText = button.getAttribute('data-original-text');
        if (originalText) {
            button.innerHTML = originalText;
            button.disabled = false;
            button.removeAttribute('data-original-text');
        }
    }
}

function refreshStatusIndicators() {
    // Only refresh if we're still on the dashboard
    if (window.location.pathname !== '/dashboard' && window.location.pathname !== '/') {
        return;
    }
    
    fetch('/api/automation/status')
        .then(response => response.json())
        .then(data => {
            // Update automation status indicator
            const statusBadge = document.querySelector('.automation-status');
            if (statusBadge) {
                statusBadge.className = `badge fs-6 ${data.running ? 'bg-success' : 'bg-secondary'}`;
                statusBadge.textContent = data.running ? 'Active' : 'Inactive';
            }
            
            // Update control button
            const controlButton = document.querySelector('.automation-control');
            if (controlButton) {
                if (data.running) {
                    controlButton.className = 'btn btn-danger btn-lg automation-control';
                    controlButton.innerHTML = '<i class="fas fa-stop me-1"></i>Stop Automation';
                    controlButton.onclick = stopAutomation;
                } else {
                    controlButton.className = 'btn btn-success btn-lg automation-control';
                    controlButton.innerHTML = '<i class="fas fa-play me-1"></i>Start Automation';
                    controlButton.onclick = startAutomation;
                }
            }
            
            // Update scheduled jobs list
            const jobsList = document.getElementById('scheduled-jobs-list');
            if (jobsList) {
                if (data.running && data.jobs && data.jobs.length > 0) {
                    let jobsHtml = '<div class="row">';
                    
                    // Group jobs by type
                    const weatherJobs = data.jobs.filter(job => job.name.includes('Weather'));
                    const tideJobs = data.jobs.filter(job => job.name.includes('Tide'));
                    
                    if (weatherJobs.length > 0) {
                        jobsHtml += '<div class="col-md-6"><h6>Weather Updates</h6><ul class="list-unstyled">';
                        weatherJobs.forEach(job => {
                            const nextRun = job.next_run ? new Date(job.next_run).toLocaleString('en-GB', {
                                timeZone: 'Europe/London',
                                hour: '2-digit',
                                minute: '2-digit',
                                day: '2-digit',
                                month: '2-digit'
                            }) : 'Not scheduled';
                            jobsHtml += `<li><i class="fas fa-clock me-1"></i>${nextRun} - ${job.name}</li>`;
                        });
                        jobsHtml += '</ul></div>';
                    }
                    
                    if (tideJobs.length > 0) {
                        jobsHtml += '<div class="col-md-6"><h6>Data Updates</h6><ul class="list-unstyled">';
                        tideJobs.forEach(job => {
                            const nextRun = job.next_run ? new Date(job.next_run).toLocaleString('en-GB', {
                                timeZone: 'Europe/London',
                                hour: '2-digit',
                                minute: '2-digit',
                                day: '2-digit',
                                month: '2-digit'
                            }) : 'Not scheduled';
                            jobsHtml += `<li><i class="fas fa-clock me-1"></i>${nextRun} - ${job.name}</li>`;
                        });
                        jobsHtml += '</ul>';
                        
                        // Add manual only section
                        jobsHtml += '<div class="mt-3"><h6>Manual Only</h6><ul class="list-unstyled">';
                        jobsHtml += '<li><i class="fas fa-upload me-1"></i>Crossing Times (Manual Upload)</li>';
                        jobsHtml += '</ul></div></div>';
                    }
                    
                    jobsHtml += '</div>';
                    jobsList.innerHTML = jobsHtml;
                } else if (data.running) {
                    jobsList.innerHTML = '<p class="text-muted">No scheduled jobs found.</p>';
                } else {
                    jobsList.innerHTML = '<p class="text-muted">Automation is inactive. Start automation to see scheduled jobs.</p>';
                }
            }
        })
        .catch(error => {
            console.error('Error refreshing status:', error);
        });
}

// API interaction functions
function makeApiCall(url, options = {}) {
    const defaultOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        }
    };
    
    const finalOptions = { ...defaultOptions, ...options };
    
    return fetch(url, finalOptions)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        });
}

// Export functions for use in templates
window.HolyIslandDB = {
    showAlert,
    showLoadingButton,
    hideLoadingButton,
    makeApiCall,
    refreshStatusIndicators
};

// Add smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Handle form submission with better UX
function handleFormSubmission(form, submitButton) {
    if (submitButton) {
        showLoadingButton(submitButton, 'Saving...');
    }
    
    // Add a small delay to show the loading state
    setTimeout(function() {
        form.submit();
    }, 100);
}

// Add event listener for forms that need loading states
document.querySelectorAll('form[method="POST"]').forEach(function(form) {
    form.addEventListener('submit', function(e) {
        const submitButton = form.querySelector('button[type="submit"]');
        if (submitButton && !submitButton.disabled) {
            e.preventDefault();
            handleFormSubmission(form, submitButton);
        }
    });
});

// Add keyboard shortcuts for common actions
document.addEventListener('keydown', function(e) {
    // Ctrl/Cmd + S to save forms
    if ((e.ctrlKey || e.metaKey) && e.key === 's') {
        const form = document.querySelector('form[method="POST"]');
        if (form) {
            e.preventDefault();
            const submitButton = form.querySelector('button[type="submit"]');
            if (submitButton) {
                submitButton.click();
            }
        }
    }
    
    // Escape key to close modals or go back
    if (e.key === 'Escape') {
        const modal = document.querySelector('.modal.show');
        if (modal) {
            const bsModal = bootstrap.Modal.getInstance(modal);
            if (bsModal) {
                bsModal.hide();
            }
        } else {
            const backButton = document.querySelector('a[href*="back"], .btn-secondary[onclick*="history"]');
            if (backButton) {
                backButton.click();
            }
        }
    }
});

// Function to refresh logs content without full page reload
function refreshLogsContent() {
    const logsContainer = document.getElementById('logs');
    if (!logsContainer) return;
    
    // Show loading indicator
    const logsTableContainer = logsContainer.querySelector('.table-responsive');
    if (logsTableContainer) {
        logsTableContainer.innerHTML = '<div class="text-center p-4"><i class="fas fa-spinner fa-spin me-2"></i>Refreshing logs...</div>';
    }
    
    // Fetch fresh logs data
    fetch('/logs', {
        method: 'GET',
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
    .then(response => response.text())
    .then(html => {
        // Create a temporary div to parse the response
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = html;
        
        // For AJAX requests, the response is just the table HTML
        if (logsTableContainer && html.trim()) {
            logsTableContainer.innerHTML = html;
        }
    })
    .catch(error => {
        console.error('Error refreshing logs:', error);
        if (logsTableContainer) {
            logsTableContainer.innerHTML = '<div class="alert alert-warning"><i class="fas fa-exclamation-triangle me-2"></i>Unable to refresh logs. Please try again.</div>';
        }
    });
}

console.log('HCDB_Rapscallion - Client application loaded');

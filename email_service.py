import os
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from datetime import datetime
from logger_config import SystemLogger

class EmailService:
    def __init__(self):
        self.logger = SystemLogger()
        self.smtp_server = "smtp.gmail.com"
        self.smtp_port = 587
        self.username = os.environ.get('GMAIL_USER')
        self.password = os.environ.get('GMAIL_APP_PASSWORD')
    
    def send_email(self, to_email, subject, body, is_html=False):
        """Send email via Gmail SMTP"""
        try:
            if not self.username or not self.password:
                raise ValueError("Gmail credentials not configured")
            
            msg = MIMEMultipart()
            msg['From'] = self.username
            msg['To'] = to_email
            msg['Subject'] = subject
            
            msg.attach(MIMEText(body, 'html' if is_html else 'plain'))
            
            with smtplib.SMTP(self.smtp_server, self.smtp_port) as server:
                server.starttls()
                server.login(self.username, self.password)
                server.send_message(msg)
            
            self.logger.log('EMAIL', f'Email sent successfully to {to_email}')
            return True
            
        except Exception as e:
            self.logger.log('EMAIL', f'Failed to send email to {to_email}: {str(e)}', level='ERROR')
            raise
    
    def send_test_email(self, to_email):
        """Send a test email"""
        subject = "HCDB_Rapscallion - Test Email"
        body = f"""
        This is a test email from the HCDB_Rapscallion system.
        
        Sent at: {datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')}
        
        If you received this email, your email configuration is working correctly.
        """
        
        return self.send_email(to_email, subject, body)
    
    def send_update_notification(self, to_email, update_type, result):
        """Send notification for successful data update"""
        subject = f"HCDB_Rapscallion - {update_type} Update Completed"
        
        body = f"""
        The {update_type} data update has completed successfully.
        
        Details:
        - Update Type: {update_type}
        - Completion Time: {datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')}
        - Records Processed: {result.get('records_processed', 'Unknown')}
        - Status: Success
        
        This is an automated notification from the Holy Island Database Administrator.
        """
        
        return self.send_email(to_email, subject, body)
    
    def send_error_notification(self, to_email, operation, error_details):
        """Send notification for errors"""
        subject = f"HCDB_Rapscallion - Error: {operation}"
        
        body = f"""
        An error occurred during the {operation} operation.
        
        Details:
        - Operation: {operation}
        - Error Time: {datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')}
        - Error Details: {error_details}
        
        Please check the system logs and take appropriate action.
        
        This is an automated notification from the Holy Island Database Administrator.
        """
        
        return self.send_email(to_email, subject, body)
    
    def send_daily_report(self, to_email, stats):
        """Send daily summary report"""
        subject = "HCDB_Rapscallion - Daily Report"
        
        body = f"""
        Daily Report - HCDB_Rapscallion Database Administrator
        
        Date: {datetime.utcnow().strftime('%Y-%m-%d')}
        
        Database Statistics:
        - Crossing Times Records: {stats.get('crossing_count', 0)}
        - Tide Data Records: {stats.get('tide_count', 0)}
        - Weather Data Records: {stats.get('weather_count', 0)}
        
        Recent Activity:
        - Successful Updates: {stats.get('successful_updates', 0)}
        - Failed Updates: {stats.get('failed_updates', 0)}
        - System Errors: {stats.get('error_count', 0)}
        
        System Status: {stats.get('system_status', 'Unknown')}
        
        This is an automated daily report from the HCDB_Rapscallion Database Administrator.
        """
        
        return self.send_email(to_email, subject, body)

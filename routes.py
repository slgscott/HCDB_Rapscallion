import os
import json
import csv
from datetime import datetime, timedelta, date, time
from io import StringIO
from flask import render_template, request, redirect, url_for, flash, session, jsonify, make_response
from sqlalchemy import desc, asc, func
from app import app, db
from models import CrossingTimes, TideData, WeatherData, ApiSettings, Users, SystemLog
from auth import login_required, check_auth, create_admin_user
from automation import AutomationManager
from api_services import WeatherService, TideService, CrossingService
from email_service import EmailService
from logger_config import SystemLogger
from utils import uk_timezone_now, format_datetime_uk, format_date_uk, paginate_query
from version import get_version

# Initialize services
automation_manager = AutomationManager()
weather_service = WeatherService()
tide_service = TideService()
crossing_service = CrossingService()
email_service = EmailService()
system_logger = SystemLogger()

# Add template functions directly to Jinja environment
app.jinja_env.globals['format_datetime_uk'] = format_datetime_uk
app.jinja_env.globals['format_date_uk'] = format_date_uk

@app.context_processor
def inject_utility_functions():
    return dict(get_version=get_version)

@app.route('/')
def index():
    if not check_auth():
        return redirect(url_for('login'))
    return redirect(url_for('dashboard'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        if not username or not password:
            flash('Username and password are required', 'error')
            return render_template('login.html')
        
        user = Users.query.filter_by(username=username).first()
        if user and check_auth(username, password):
            session['admin_user'] = username
            session['logged_in'] = True
            system_logger.log('AUTH', f'Admin user {username} logged in')
            return redirect(url_for('dashboard'))
        else:
            flash('Invalid credentials', 'error')
            system_logger.log('AUTH', f'Failed login attempt for {username}', level='WARNING')
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    username = session.get('admin_user', 'Unknown')
    session.clear()
    system_logger.log('AUTH', f'Admin user {username} logged out')
    flash('You have been logged out', 'info')
    return redirect(url_for('login'))

@app.route('/dashboard')
@login_required
def dashboard():
    # Get system status
    automation_status = automation_manager.get_status()
    script_status = automation_manager.get_script_status()
    
    # Get recent logs
    recent_logs = SystemLog.query.order_by(desc(SystemLog.timestamp)).limit(10).all()
    # No formatting here - let template handle it
    
    # Get data counts
    crossing_count = CrossingTimes.query.count()
    tide_count = TideData.query.count()
    weather_count = WeatherData.query.count()
    
    # Get recent data for View Data tab (newest first) - show first page
    recent_crossings = CrossingTimes.query.order_by(desc(CrossingTimes.updated_at), desc(CrossingTimes.date)).limit(20).all()
    recent_tides = TideData.query.order_by(desc(TideData.updated_at), desc(TideData.date)).limit(20).all()
    recent_weather = WeatherData.query.order_by(desc(WeatherData.updated_at), desc(WeatherData.date)).limit(20).all()
    
    # Get last updated timestamps for each table
    last_crossing_update = db.session.query(func.max(CrossingTimes.updated_at)).scalar()
    last_tide_update = db.session.query(func.max(TideData.updated_at)).scalar()
    last_weather_update = db.session.query(func.max(WeatherData.updated_at)).scalar()
    
    return render_template('dashboard.html',
                         automation_status=automation_status,
                         script_status=script_status,
                         recent_logs=recent_logs,
                         crossing_count=crossing_count,
                         tide_count=tide_count,
                         weather_count=weather_count,
                         recent_crossings=recent_crossings,
                         recent_tides=recent_tides,
                         recent_weather=recent_weather,
                         last_crossing_update=last_crossing_update,
                         last_tide_update=last_tide_update,
                         last_weather_update=last_weather_update,
                         page=1,
                         per_page=20)

@app.route('/logs')
@login_required
def logs():
    page = request.args.get('page', 1, type=int)
    level_filter = request.args.get('level', '')
    component_filter = request.args.get('component', '')
    date_filter = request.args.get('date', '')
    
    query = SystemLog.query.order_by(desc(SystemLog.timestamp))
    
    # Apply filters
    if level_filter:
        query = query.filter(SystemLog.level == level_filter)
    if component_filter:
        query = query.filter(SystemLog.component.contains(component_filter))
    if date_filter:
        try:
            filter_date = datetime.strptime(date_filter, '%Y-%m-%d').date()
            query = query.filter(db.func.date(SystemLog.timestamp) == filter_date)
        except ValueError:
            pass
    
    pagination = query.paginate(page=page, per_page=50, error_out=False)
    logs = pagination.items
    
    # No formatting here - let template handle it
    
    # Get available levels and components for filters
    levels = db.session.query(SystemLog.level).distinct().all()
    components = db.session.query(SystemLog.component).distinct().all()
    
    # Check if this is an AJAX request for just the table content
    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return render_template('logs_table.html', logs=logs)
    
    return render_template('logs.html',
                         logs=logs,
                         pagination=pagination,
                         levels=[l[0] for l in levels],
                         components=[c[0] for c in components],
                         current_filters={
                             'level': level_filter,
                             'component': component_filter,
                             'date': date_filter
                         })

# All data management is now integrated into the dashboard interface

# API endpoints
@app.route('/api/automation/start', methods=['POST'])
@login_required
def start_automation():
    try:
        automation_manager.start()
        system_logger.log('AUTOMATION', 'Automation system started by admin')
        return jsonify({'status': 'success', 'message': 'Automation started'})
    except Exception as e:
        system_logger.log('AUTOMATION', f'Error starting automation: {str(e)}', level='ERROR')
        return jsonify({'status': 'error', 'message': str(e)}), 500

@app.route('/api/automation/stop', methods=['POST'])
@login_required
def stop_automation():
    try:
        automation_manager.stop()
        system_logger.log('AUTOMATION', 'Automation system stopped by admin')
        return jsonify({'status': 'success', 'message': 'Automation stopped'})
    except Exception as e:
        system_logger.log('AUTOMATION', f'Error stopping automation: {str(e)}', level='ERROR')
        return jsonify({'status': 'error', 'message': str(e)}), 500

@app.route('/api/automation/status')
@login_required
def automation_status():
    return jsonify(automation_manager.get_status())

@app.route('/api/scripts/<script_name>/run', methods=['POST'])
@login_required
def run_script(script_name):
    data = request.json if request.json else {}
    dry_run = data.get('dry_run', False)
    
    try:
        if script_name == 'weather':
            result = weather_service.update_weather_data(dry_run=dry_run)
        elif script_name == 'tides':
            result = tide_service.update_tide_data(dry_run=dry_run)
        elif script_name == 'crossing':
            # Get date parameters from request (already in YYYY-MM-DD format from HTML5 date inputs)
            from_date = data.get('from_date')
            to_date = data.get('to_date')
            result = crossing_service.update_crossing_data(dry_run=dry_run, from_date=from_date, to_date=to_date)
        else:
            return jsonify({'status': 'error', 'message': 'Invalid script name'}), 400
        
        system_logger.log('SCRIPT', f'Manual execution of {script_name} script (dry_run={dry_run})')
        return jsonify({'status': 'success', 'result': result})
    except Exception as e:
        system_logger.log('SCRIPT', f'Error running {script_name} script: {str(e)}', level='ERROR')
        return jsonify({'status': 'error', 'message': str(e)}), 500

@app.route('/api/test-email', methods=['POST'])
@login_required
def test_email():
    try:
        recipient = os.environ.get('ADMIN_EMAIL', 'admin@example.com')
        result = email_service.send_test_email(recipient)
        system_logger.log('EMAIL', f'Test email sent to {recipient}')
        return jsonify({'status': 'success', 'message': 'Test email sent'})
    except Exception as e:
        system_logger.log('EMAIL', f'Error sending test email: {str(e)}', level='ERROR')
        return jsonify({'status': 'error', 'message': str(e)}), 500

# Pagination API routes for View Data tab
@app.route('/api/data/<data_type>')
@login_required
def get_paginated_data(data_type):
    page = request.args.get('page', 1, type=int)
    per_page = 20
    
    if data_type == 'crossing':
        query = CrossingTimes.query.order_by(desc(CrossingTimes.updated_at), desc(CrossingTimes.date))
        pagination = query.paginate(page=page, per_page=per_page, error_out=False)
        data = pagination.items
        template_data = [{
            'id': item.id,
            'date': format_date_uk(item.date),
            'safe_from_1': item.safe_from_1,
            'safe_to_1': item.safe_to_1,
            'safe_from_2': item.safe_from_2,
            'safe_to_2': item.safe_to_2,
            'unsafe_from_1': item.unsafe_from_1,
            'unsafe_to_1': item.unsafe_to_1,
            'unsafe_from_2': item.unsafe_from_2,
            'unsafe_to_2': item.unsafe_to_2,
            'updated_at': format_datetime_uk(item.updated_at)
        } for item in data]
        
    elif data_type == 'tide':
        query = TideData.query.order_by(desc(TideData.updated_at), desc(TideData.date))
        pagination = query.paginate(page=page, per_page=per_page, error_out=False)
        data = pagination.items
        template_data = [{
            'id': item.id,
            'date': format_date_uk(item.date),
            'high_tide_1_time': item.high_tide_1_time,
            'high_tide_1_height': item.high_tide_1_height,
            'low_tide_1_time': item.low_tide_1_time,
            'low_tide_1_height': item.low_tide_1_height,
            'high_tide_2_time': item.high_tide_2_time,
            'high_tide_2_height': item.high_tide_2_height,
            'low_tide_2_time': item.low_tide_2_time,
            'low_tide_2_height': item.low_tide_2_height,
            'updated_at': format_datetime_uk(item.updated_at)
        } for item in data]
        
    elif data_type == 'weather':
        query = WeatherData.query.order_by(desc(WeatherData.updated_at), desc(WeatherData.date))
        pagination = query.paginate(page=page, per_page=per_page, error_out=False)
        data = pagination.items
        template_data = [{
            'id': item.id,
            'date': format_date_uk(item.date),
            'temperature_min': item.temperature_min,
            'temperature_max': item.temperature_max,
            'temperature': item.temperature,
            'precipitation_sum': item.precipitation_sum,
            'wind_speed': item.wind_speed,
            'wind_speed_max': item.wind_speed_max,
            'updated_at': format_datetime_uk(item.updated_at)
        } for item in data]
        
    else:
        return jsonify({'error': 'Invalid data type'}), 400
    
    return jsonify({
        'data': template_data,
        'pagination': {
            'page': pagination.page,
            'pages': pagination.pages,
            'per_page': pagination.per_page,
            'total': pagination.total,
            'has_prev': pagination.has_prev,
            'has_next': pagination.has_next,
            'prev_num': pagination.prev_num,
            'next_num': pagination.next_num
        }
    })

# Export functionality integrated into dashboard View Data tabs

# Initialize admin user if none exists - called from first request
admin_initialized = False

@app.before_request
def initialize_admin():
    global admin_initialized
    if not admin_initialized:
        try:
            if not Users.query.first():
                create_admin_user('admin', 'admin123')  # Default credentials
                system_logger.log('INIT', 'Default admin user created (username: admin, password: admin123)')
        except Exception as e:
            # Tables might not exist yet
            pass
        admin_initialized = True

import os
import json
import csv
from datetime import datetime, timedelta, date, time
from io import StringIO
from flask import render_template, request, redirect, url_for, flash, session, jsonify, make_response
from sqlalchemy import desc, asc
from app import app, db
from models import CrossingTimes, TideData, WeatherData, ApiSettings, AdminUser, SystemLog
from auth import login_required, check_auth, create_admin_user
from automation import AutomationManager
from api_services import WeatherService, TideService, CrossingService
from email_service import EmailService
from logger_config import SystemLogger
from utils import uk_timezone_now, format_datetime_uk, paginate_query

# Initialize services
automation_manager = AutomationManager()
weather_service = WeatherService()
tide_service = TideService()
crossing_service = CrossingService()
email_service = EmailService()
system_logger = SystemLogger()

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
        
        user = AdminUser.query.filter_by(username=username, is_active=True).first()
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
    
    # Get data counts
    crossing_count = CrossingTimes.query.count()
    tide_count = TideData.query.count()
    weather_count = WeatherData.query.count()
    
    return render_template('dashboard.html',
                         automation_status=automation_status,
                         script_status=script_status,
                         recent_logs=recent_logs,
                         crossing_count=crossing_count,
                         tide_count=tide_count,
                         weather_count=weather_count)

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
    
    # Get available levels and components for filters
    levels = db.session.query(SystemLog.level).distinct().all()
    components = db.session.query(SystemLog.component).distinct().all()
    
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

# Data management routes
@app.route('/data/<table_name>')
@login_required
def data_table(table_name):
    page = request.args.get('page', 1, type=int)
    search = request.args.get('search', '')
    
    model_map = {
        'crossing_times': CrossingTimes,
        'tide_data': TideData,
        'weather_data': WeatherData
    }
    
    if table_name not in model_map:
        flash('Invalid table name', 'error')
        return redirect(url_for('dashboard'))
    
    model = model_map[table_name]
    query = model.query.order_by(desc(model.id))
    
    if search:
        # Basic search implementation
        if table_name == 'crossing_times':
            query = query.filter(
                db.or_(
                    model.weather_conditions.contains(search),
                    model.date.cast(db.String).contains(search)
                )
            )
        elif table_name == 'tide_data':
            query = query.filter(
                db.or_(
                    model.location.contains(search),
                    model.tide_type.contains(search)
                )
            )
        elif table_name == 'weather_data':
            query = query.filter(
                db.or_(
                    model.conditions.contains(search),
                    model.wind_direction.contains(search)
                )
            )
    
    pagination = query.paginate(page=page, per_page=20, error_out=False)
    records = pagination.items
    
    return render_template('data_table.html',
                         table_name=table_name,
                         records=records,
                         pagination=pagination,
                         search=search)

@app.route('/data/<table_name>/add', methods=['GET', 'POST'])
@login_required
def add_record(table_name):
    model_map = {
        'crossing_times': CrossingTimes,
        'tide_data': TideData,
        'weather_data': WeatherData
    }
    
    if table_name not in model_map:
        flash('Invalid table name', 'error')
        return redirect(url_for('dashboard'))
    
    model = model_map[table_name]
    
    if request.method == 'POST':
        try:
            record = model()
            
            # Set fields based on form data
            for field in request.form:
                if hasattr(record, field) and field != 'id':
                    value = request.form.get(field)
                    if value:
                        setattr(record, field, value)
            
            db.session.add(record)
            db.session.commit()
            
            flash(f'Record added successfully', 'success')
            system_logger.log('DATA', f'Added new record to {table_name}')
            return redirect(url_for('data_table', table_name=table_name))
            
        except Exception as e:
            db.session.rollback()
            flash(f'Error adding record: {str(e)}', 'error')
            system_logger.log('DATA', f'Error adding record to {table_name}: {str(e)}', level='ERROR')
    
    return render_template('data_form.html', table_name=table_name, record=None)

@app.route('/data/<table_name>/edit/<int:record_id>', methods=['GET', 'POST'])
@login_required
def edit_record(table_name, record_id):
    model_map = {
        'crossing_times': CrossingTimes,
        'tide_data': TideData,
        'weather_data': WeatherData
    }
    
    if table_name not in model_map:
        flash('Invalid table name', 'error')
        return redirect(url_for('dashboard'))
    
    model = model_map[table_name]
    record = model.query.get_or_404(record_id)
    
    if request.method == 'POST':
        try:
            # Update fields based on form data
            for field in request.form:
                if hasattr(record, field) and field != 'id':
                    value = request.form.get(field)
                    setattr(record, field, value if value else None)
            
            record.updated_at = datetime.utcnow()
            db.session.commit()
            
            flash(f'Record updated successfully', 'success')
            system_logger.log('DATA', f'Updated record {record_id} in {table_name}')
            return redirect(url_for('data_table', table_name=table_name))
            
        except Exception as e:
            db.session.rollback()
            flash(f'Error updating record: {str(e)}', 'error')
            system_logger.log('DATA', f'Error updating record {record_id} in {table_name}: {str(e)}', level='ERROR')
    
    return render_template('data_form.html', table_name=table_name, record=record)

@app.route('/data/<table_name>/delete/<int:record_id>', methods=['POST'])
@login_required
def delete_record(table_name, record_id):
    model_map = {
        'crossing_times': CrossingTimes,
        'tide_data': TideData,
        'weather_data': WeatherData
    }
    
    if table_name not in model_map:
        flash('Invalid table name', 'error')
        return redirect(url_for('dashboard'))
    
    model = model_map[table_name]
    record = model.query.get_or_404(record_id)
    
    try:
        db.session.delete(record)
        db.session.commit()
        flash(f'Record deleted successfully', 'success')
        system_logger.log('DATA', f'Deleted record {record_id} from {table_name}')
    except Exception as e:
        db.session.rollback()
        flash(f'Error deleting record: {str(e)}', 'error')
        system_logger.log('DATA', f'Error deleting record {record_id} from {table_name}: {str(e)}', level='ERROR')
    
    return redirect(url_for('data_table', table_name=table_name))

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
    dry_run = request.json.get('dry_run', False) if request.json else False
    
    try:
        if script_name == 'weather':
            result = weather_service.update_weather_data(dry_run=dry_run)
        elif script_name == 'tides':
            result = tide_service.update_tide_data(dry_run=dry_run)
        elif script_name == 'crossing':
            result = crossing_service.update_crossing_data(dry_run=dry_run)
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

@app.route('/api/export/<table_name>')
@login_required
def export_data(table_name):
    export_format = request.args.get('format', 'csv')
    date_from = request.args.get('date_from')
    date_to = request.args.get('date_to')
    
    model_map = {
        'crossing_times': CrossingTimes,
        'tide_data': TideData,
        'weather_data': WeatherData
    }
    
    if table_name not in model_map:
        return jsonify({'error': 'Invalid table name'}), 400
    
    model = model_map[table_name]
    query = model.query
    
    # Apply date filters
    if date_from:
        query = query.filter(model.created_at >= date_from)
    if date_to:
        query = query.filter(model.created_at <= date_to)
    
    records = query.all()
    
    if export_format == 'json':
        data = []
        for record in records:
            record_dict = {}
            for column in record.__table__.columns:
                value = getattr(record, column.name)
                if isinstance(value, (datetime, date, time)):
                    value = value.isoformat()
                elif isinstance(value, timedelta):
                    value = str(value)
                elif value is None:
                    value = ''
                record_dict[column.name] = value
            data.append(record_dict)
        
        response = make_response(json.dumps(data, indent=2))
        response.headers['Content-Type'] = 'application/json'
        response.headers['Content-Disposition'] = f'attachment; filename={table_name}.json'
        
    else:  # CSV format
        output = StringIO()
        if records:
            fieldnames = [column.name for column in records[0].__table__.columns]
            writer = csv.DictWriter(output, fieldnames=fieldnames)
            writer.writeheader()
            
            for record in records:
                record_dict = {}
                for column in record.__table__.columns:
                    value = getattr(record, column.name)
                    if isinstance(value, (datetime, date, time)):
                        value = value.isoformat()
                    elif isinstance(value, timedelta):
                        value = str(value)
                    elif value is None:
                        value = ''
                    record_dict[column.name] = value
                writer.writerow(record_dict)
        
        response = make_response(output.getvalue())
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = f'attachment; filename={table_name}.csv'
    
    system_logger.log('EXPORT', f'Data export: {table_name} as {export_format}')
    return response

# Initialize admin user if none exists - called from first request
admin_initialized = False

@app.before_request
def initialize_admin():
    global admin_initialized
    if not admin_initialized:
        try:
            if not AdminUser.query.first():
                create_admin_user('admin', 'admin123')  # Default credentials
                system_logger.log('INIT', 'Default admin user created (username: admin, password: admin123)')
        except Exception as e:
            # Tables might not exist yet
            pass
        admin_initialized = True

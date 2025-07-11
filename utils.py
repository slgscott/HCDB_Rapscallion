import pytz
from datetime import datetime
from flask import request

def uk_timezone_now():
    """Get current time in UK timezone (handles BST/GMT automatically)"""
    uk_tz = pytz.timezone('Europe/London')
    return datetime.now(uk_tz)

def format_datetime_uk(dt):
    """Format datetime for UK timezone display"""
    if dt is None:
        return 'Never'
    
    uk_tz = pytz.timezone('Europe/London')
    
    # Handle both timezone-aware and naive datetime objects
    if dt.tzinfo is None:
        # Assume naive datetime is UTC
        dt = pytz.utc.localize(dt)
    
    # Convert to UK timezone
    uk_dt = dt.astimezone(uk_tz)
    
    # Format as DD/MM/YYYY HH:MM (timezone indicated in column header)
    return uk_dt.strftime('%d/%m/%Y %H:%M')

def format_date_uk(date_str):
    """Convert YYYY-MM-DD date string to DD/MM/YYYY format"""
    if not date_str:
        return ''
    
    try:
        # Handle both string dates and datetime objects
        if isinstance(date_str, str):
            if '/' in date_str:
                return date_str  # Already in DD/MM/YYYY format
            # Convert YYYY-MM-DD to DD/MM/YYYY
            dt = datetime.strptime(date_str, '%Y-%m-%d')
        else:
            dt = date_str
        
        return dt.strftime('%d/%m/%Y')
    except:
        return str(date_str)

def paginate_query(query, page=1, per_page=20):
    """Paginate a SQLAlchemy query"""
    page = max(1, page)
    offset = (page - 1) * per_page
    
    total = query.count()
    items = query.offset(offset).limit(per_page).all()
    
    has_prev = page > 1
    has_next = offset + per_page < total
    
    return {
        'items': items,
        'page': page,
        'per_page': per_page,
        'total': total,
        'has_prev': has_prev,
        'has_next': has_next,
        'prev_num': page - 1 if has_prev else None,
        'next_num': page + 1 if has_next else None
    }

def get_table_columns(table_name):
    """Get column information for a table"""
    column_info = {
        'crossing_times': [
            {'name': 'date', 'type': 'date', 'required': True},
            {'name': 'safe_crossing_time', 'type': 'time', 'required': False},
            {'name': 'next_safe_time', 'type': 'time', 'required': False},
            {'name': 'tide_height', 'type': 'number', 'required': False, 'step': '0.01'},
            {'name': 'weather_conditions', 'type': 'text', 'required': False},
            {'name': 'source_url', 'type': 'url', 'required': False}
        ],
        'tide_data': [
            {'name': 'datetime', 'type': 'datetime-local', 'required': True},
            {'name': 'height', 'type': 'number', 'required': True, 'step': '0.01'},
            {'name': 'tide_type', 'type': 'text', 'required': False},
            {'name': 'location', 'type': 'text', 'required': False, 'default': 'Holy Island'},
            {'name': 'api_source', 'type': 'text', 'required': False}
        ],
        'weather_data': [
            {'name': 'datetime', 'type': 'datetime-local', 'required': True},
            {'name': 'temperature', 'type': 'number', 'required': False, 'step': '0.1'},
            {'name': 'humidity', 'type': 'number', 'required': False, 'min': '0', 'max': '100'},
            {'name': 'wind_speed', 'type': 'number', 'required': False, 'step': '0.1'},
            {'name': 'wind_direction', 'type': 'text', 'required': False},
            {'name': 'conditions', 'type': 'text', 'required': False},
            {'name': 'forecast_day', 'type': 'number', 'required': False, 'min': '0'},
            {'name': 'api_source', 'type': 'text', 'required': False}
        ]
    }
    
    return column_info.get(table_name, [])

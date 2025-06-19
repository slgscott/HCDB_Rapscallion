from datetime import datetime
from app import db
from sqlalchemy import Column, Integer, String, Date, Time, DECIMAL, Text, TIMESTAMP, Boolean, func

class CrossingTimes(db.Model):
    __tablename__ = 'crossing_times'
    
    id = Column(Integer, primary_key=True)
    date = Column(Date, nullable=False)
    safe_crossing_time = Column(Time)
    next_safe_time = Column(Time)
    tide_height = Column(DECIMAL(4,2))
    weather_conditions = Column(String(255))
    source_url = Column(Text)
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class TideData(db.Model):
    __tablename__ = 'tide_data'
    
    id = Column(Integer, primary_key=True)
    datetime = Column(TIMESTAMP, nullable=False)
    height = Column(DECIMAL(5,2), nullable=False)
    tide_type = Column(String(50))
    location = Column(String(255), default='Holy Island')
    api_source = Column(String(100))
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class WeatherData(db.Model):
    __tablename__ = 'weather_data'
    
    id = Column(Integer, primary_key=True)
    datetime = Column(TIMESTAMP, nullable=False)
    temperature = Column(DECIMAL(4,1))
    humidity = Column(Integer)
    wind_speed = Column(DECIMAL(4,1))
    wind_direction = Column(String(10))
    conditions = Column(String(255))
    forecast_day = Column(Integer)
    api_source = Column(String(100))
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class ApiSettings(db.Model):
    __tablename__ = 'api_settings'
    
    id = Column(Integer, primary_key=True)
    data_type = Column(String(50), nullable=False)
    source_name = Column(String(255), nullable=False)
    base_url = Column(Text, nullable=False)
    api_key_required = Column(Boolean, default=False)
    update_frequency = Column(String(50))
    is_active = Column(Boolean, default=True)
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class AdminUser(db.Model):
    __tablename__ = 'admin_users'
    
    id = Column(Integer, primary_key=True)
    username = Column(String(64), unique=True, nullable=False)
    password_hash = Column(String(256), nullable=False)
    email = Column(String(120))
    is_active = Column(Boolean, default=True)
    created_at = Column(TIMESTAMP, default=func.now())

class SystemLog(db.Model):
    __tablename__ = 'system_logs'
    
    id = Column(Integer, primary_key=True)
    timestamp = Column(TIMESTAMP, default=func.now(), nullable=False)
    level = Column(String(20), nullable=False)
    component = Column(String(100), nullable=False)
    message = Column(Text, nullable=False)
    details = Column(Text)

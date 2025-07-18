from datetime import datetime
from app import db
from sqlalchemy import Column, Integer, String, Text, TIMESTAMP, Boolean, func, Float

class CrossingTimes(db.Model):
    __tablename__ = 'crossing_times'
    
    id = Column(Integer, primary_key=True)
    date = Column(Text, nullable=False)
    from_date = Column(Text)
    to_date = Column(Text)
    safe_from_1 = Column(Text)
    safe_to_1 = Column(Text)
    safe_from_2 = Column(Text)
    safe_to_2 = Column(Text)
    unsafe_from_1 = Column(Text)
    unsafe_to_1 = Column(Text)
    unsafe_from_2 = Column(Text)
    unsafe_to_2 = Column(Text)
    status = Column(Text, nullable=False, default='active')
    notes = Column(Text)
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class TideData(db.Model):
    __tablename__ = 'tide_data'
    
    id = Column(Integer, primary_key=True)
    date = Column(Text, nullable=False)
    high_tide_1_time = Column(Text)
    high_tide_1_height = Column(Float)
    low_tide_1_time = Column(Text)
    low_tide_1_height = Column(Float)
    high_tide_2_time = Column(Text)
    high_tide_2_height = Column(Float)
    low_tide_2_time = Column(Text)
    low_tide_2_height = Column(Float)
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class WeatherData(db.Model):
    __tablename__ = 'weather_data'
    
    id = Column(Integer, primary_key=True)
    date = Column(Text, nullable=False)
    temperature = Column(Integer)
    condition = Column(Text)
    description = Column(Text)
    wind_speed = Column(Integer)
    humidity = Column(Integer)
    wind_direction = Column(Text)
    temperature_min = Column(Float)
    temperature_max = Column(Float)
    precipitation_sum = Column(Float)
    wind_speed_max = Column(Float)
    wind_direction_dominant = Column(Integer)
    uv_index_max = Column(Float)
    source = Column(Text)
    cloudcover = Column(Integer)
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class ApiSettings(db.Model):
    __tablename__ = 'api_settings'
    
    id = Column(Integer, primary_key=True)
    data_type = Column(Text, nullable=False)
    source_url = Column(Text, nullable=False)
    api_key = Column(Text)
    notes = Column(Text)
    is_default = Column(Boolean, default=False)
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class Users(db.Model):
    __tablename__ = 'users'
    
    id = Column(Integer, primary_key=True)
    username = Column(Text, nullable=False)
    password = Column(Text, nullable=False)
    
    def __init__(self, username, password):
        self.username = username
        self.password = password

class SystemSettings(db.Model):
    __tablename__ = 'system_settings'
    
    id = Column(Integer, primary_key=True)
    setting_key = Column(String(100), unique=True, nullable=False)
    setting_value = Column(Text)
    description = Column(Text)
    created_at = Column(TIMESTAMP, default=func.now())
    updated_at = Column(TIMESTAMP, default=func.now(), onupdate=func.now())

class SystemLog(db.Model):
    __tablename__ = 'system_logs'
    
    id = Column(Integer, primary_key=True)
    timestamp = Column(TIMESTAMP, default=func.now(), nullable=False)
    level = Column(String(20), nullable=False)
    component = Column(String(100), nullable=False)
    message = Column(Text, nullable=False)
    details = Column(Text)
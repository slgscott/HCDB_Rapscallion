-- Railway PostgreSQL Schema Export
-- Core tables for Holy Island Crossing Database

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL
);

-- Crossing Times table
CREATE TABLE crossing_times (
    id SERIAL PRIMARY KEY,
    date TEXT NOT NULL,
    from_date TEXT,
    to_date TEXT,
    safe_from_1 TEXT,
    safe_to_1 TEXT,
    safe_from_2 TEXT,
    safe_to_2 TEXT,
    unsafe_from_1 TEXT,
    unsafe_to_1 TEXT,
    unsafe_from_2 TEXT,
    unsafe_to_2 TEXT,
    status TEXT NOT NULL DEFAULT 'active',
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Weather Data table
CREATE TABLE weather_data (
    id SERIAL PRIMARY KEY,
    date TEXT NOT NULL,
    temperature INTEGER,
    condition TEXT,
    description TEXT,
    wind_speed INTEGER,
    humidity INTEGER,
    wind_direction TEXT,
    temperature_min FLOAT,
    temperature_max FLOAT,
    precipitation_sum FLOAT,
    wind_speed_max FLOAT,
    wind_direction_dominant INTEGER,
    uv_index_max FLOAT,
    source TEXT,
    cloudcover INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Tide Data table
CREATE TABLE tide_data (
    id SERIAL PRIMARY KEY,
    date TEXT NOT NULL,
    high_tide_1_time TEXT,
    high_tide_1_height FLOAT,
    low_tide_1_time TEXT,
    low_tide_1_height FLOAT,
    high_tide_2_time TEXT,
    high_tide_2_height FLOAT,
    low_tide_2_time TEXT,
    low_tide_2_height FLOAT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- System Settings table
CREATE TABLE system_settings (
    id SERIAL PRIMARY KEY,
    setting_key VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- API Settings table
CREATE TABLE api_settings (
    id SERIAL PRIMARY KEY,
    data_type TEXT NOT NULL,
    source_url TEXT NOT NULL,
    api_key TEXT,
    notes TEXT,
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- System Logs table
CREATE TABLE system_logs (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT NOW() NOT NULL,
    level VARCHAR(20) NOT NULL,
    component VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    details TEXT
);

-- Insert default API settings
INSERT INTO api_settings (data_type, source_url, notes, is_default) VALUES
('weather', 'https://api.open-meteo.com/v1/forecast', 'Open-Meteo Weather API', TRUE),
('tide', 'https://admiraltyapi.azure-api.net/ukho/tides/api/V1/Stations', 'UK Hydrographic Office API', TRUE),
('crossing', 'https://holyislandcrossingtimes.northumberland.gov.uk/Default.aspx', 'Northumberland County Council', TRUE);
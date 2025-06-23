# Holy Island Crossing Database (HCDB_Rapscallion)

## Overview

HCDB_Rapscallion is a Flask-based web application designed to manage crossing times, weather data, and tide information for Holy Island. The system provides an administrative interface for data management, automated data collection from external APIs, and scheduled tasks for maintaining up-to-date information about safe crossing conditions.

## System Architecture

The application follows a traditional Flask web application architecture with the following key components:

- **Backend**: Flask web framework with SQLAlchemy ORM
- **Database**: PostgreSQL with environment-specific configurations (Neon for development, Railway for production)
- **Frontend**: Server-side rendered templates using Jinja2 with Bootstrap for styling
- **Automation**: APScheduler for background tasks and data synchronization
- **Authentication**: Session-based authentication with password hashing

## Key Components

### Core Application Structure
- `main.py`: Application entry point and WSGI configuration
- `app.py`: Flask application factory with database configuration
- `routes.py`: All HTTP route handlers and view logic
- `models.py`: SQLAlchemy database models defining the data schema

### Data Management
- `CrossingTimes`: Stores safe/unsafe crossing windows with time ranges
- `WeatherData`: Weather information from external APIs
- `TideData`: Tide predictions and actual measurements
- `SystemLog`: Application logging and audit trail
- `Users`: Administrative user accounts

### External Integrations
- `api_services.py`: Services for fetching data from Open-Meteo weather API and tide prediction services
- `email_service.py`: Gmail SMTP integration for notifications
- `automation.py`: Scheduled task management using APScheduler

### Utilities and Support
- `auth.py`: Authentication middleware and user management
- `logger_config.py`: Centralized logging to both files and database
- `utils.py`: Timezone handling, date formatting, and pagination utilities
- `version.py`: Application version management

## Data Flow

1. **Data Input**: Manual entry through web forms or automated collection via external APIs
2. **Processing**: Data validation and formatting before database storage
3. **Storage**: PostgreSQL database with separate tables for each data type
4. **Presentation**: Web interface displays formatted data with search and pagination
5. **Automation**: Scheduled tasks update weather and tide data automatically
6. **Logging**: All operations logged to database for audit purposes

## External Dependencies

### Core Framework Dependencies
- Flask 3.1.1: Web framework
- SQLAlchemy 2.0.41: Database ORM
- Flask-SQLAlchemy 3.1.1: Flask-SQLAlchemy integration

### Data and API Dependencies
- requests 2.32.4: HTTP client for external API calls
- beautifulsoup4 4.13.4: HTML parsing for web scraping
- pytz 2025.2: Timezone handling

### Background Processing
- APScheduler 3.11.0: Task scheduling and automation
- gunicorn 23.0.0: WSGI server for production deployment

### Database Connectivity
- psycopg2-binary 2.9.10: PostgreSQL adapter

### Authentication and Security
- werkzeug 3.1.3: Password hashing and security utilities
- email-validator 2.2.0: Email validation

## Deployment Strategy

The application supports multiple deployment environments:

### Development Environment
- Uses Neon PostgreSQL database
- Local development server via Flask's built-in server
- Environment detection via `APP_ENVIRONMENT` variable

### Production Environment
- Deployed on Railway platform
- Uses Railway's managed PostgreSQL service
- Gunicorn WSGI server with auto-scaling capabilities
- Environment-specific database URL handling

### Configuration Management
- Environment variables for database URLs and API credentials
- Separate configurations for development and production
- Automatic database URL parsing and conversion (postgres:// to postgresql://)

### Deployment Files
- `Procfile`: Heroku-style process definitions
- `railway.toml`: Railway platform configuration
- `.replit`: Replit environment configuration
- `pyproject.toml`: Python project dependencies

## Changelog

- June 23, 2025. Initial setup

## User Preferences

Preferred communication style: Simple, everyday language.
import os
import logging
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase
from werkzeug.middleware.proxy_fix import ProxyFix

# Configure logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s %(name)s: %(message)s'
)

class Base(DeclarativeBase):
    pass

db = SQLAlchemy(model_class=Base)

# Create the app
app = Flask(__name__)
app.secret_key = os.environ.get("SESSION_SECRET", "holy-island-admin-secret-key")
app.wsgi_app = ProxyFix(app.wsgi_app, x_proto=1, x_host=1)

# Configure the database with environment switching
def get_database_url():
    """Get database URL based on environment"""
    # Check for explicit environment setting
    env = os.environ.get("APP_ENVIRONMENT", "development").lower()
    
    if env == "production":
        # Use Railway database in production
        database_url = os.environ.get("RAILWAY_DATABASE_URL") or os.environ.get("DATABASE_URL")
    else:
        # Use development database (Neon) by default
        database_url = os.environ.get("DATABASE_URL")
    
    # Handle postgres:// to postgresql:// conversion
    if database_url and database_url.startswith("postgres://"):
        database_url = database_url.replace("postgres://", "postgresql://", 1)
    
    return database_url

database_url = get_database_url()
app.config["SQLALCHEMY_DATABASE_URI"] = database_url

# Log which database is being used
env = os.environ.get("APP_ENVIRONMENT", "development")
db_type = "Railway (Production)" if env.lower() == "production" else "Neon (Development)"
print(f"Using {db_type} database: {database_url[:50]}...")
app.config["SQLALCHEMY_ENGINE_OPTIONS"] = {
    "pool_recycle": 300,
    "pool_pre_ping": True,
}
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# Initialize the app with the extension
db.init_app(app)

with app.app_context():
    # Import models to ensure tables are created
    import models  # noqa: F401
    # Create all tables
    db.create_all()
    logging.info("Database connection established and tables created")

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

# Configure the database - try multiple Railway environment variables
database_url = (
    os.environ.get("DATABASE_URL") or 
    os.environ.get("POSTGRES_URL") or 
    os.environ.get("DATABASE_PRIVATE_URL") or
    os.environ.get("POSTGRES_PRIVATE_URL")
)

logging.info(f"Raw DATABASE_URL: {database_url}")
logging.info(f"All DB env vars: DATABASE_URL={os.environ.get('DATABASE_URL')}, POSTGRES_URL={os.environ.get('POSTGRES_URL')}")

if database_url and database_url.startswith("postgres://"):
    database_url = database_url.replace("postgres://", "postgresql://", 1)
    logging.info(f"Converted DATABASE_URL: {database_url}")

if not database_url:
    logging.error("No database URL found in environment variables")
    raise ValueError("DATABASE_URL or POSTGRES_URL environment variable is required")

app.config["SQLALCHEMY_DATABASE_URI"] = database_url
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

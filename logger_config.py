import logging
from datetime import datetime
from app import db
from models import SystemLog

class SystemLogger:
    def __init__(self):
        self.logger = logging.getLogger('HolyIslandDB')
        
    def log(self, component, message, level='INFO', details=None):
        """Log message to both file and database"""
        try:
            # Log to Python logging system
            log_method = getattr(self.logger, level.lower(), self.logger.info)
            log_method(f"[{component}] {message}")
            
            # Log to database
            log_entry = SystemLog(
                timestamp=datetime.utcnow(),
                level=level,
                component=component,
                message=message,
                details=details
            )
            
            db.session.add(log_entry)
            db.session.commit()
            
        except Exception as e:
            # Fallback to basic logging if database logging fails
            self.logger.error(f"Failed to log to database: {str(e)}")
            self.logger.error(f"Original message: [{component}] {message}")

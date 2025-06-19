import os
from datetime import datetime
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.triggers.cron import CronTrigger
from apscheduler.executors.pool import ThreadPoolExecutor
import pytz
from logger_config import SystemLogger
from api_services import WeatherService, TideService, CrossingService
from email_service import EmailService

class AutomationManager:
    def __init__(self):
        self.scheduler = BackgroundScheduler(
            executors={'default': ThreadPoolExecutor(5)},
            timezone=pytz.timezone('Europe/London')
        )
        self.is_running = False
        self.logger = SystemLogger()
        
        # Initialize services
        self.weather_service = WeatherService()
        self.tide_service = TideService()
        self.crossing_service = CrossingService()
        self.email_service = EmailService()
        
        # Set up cron jobs
        self._setup_jobs()
    
    def _setup_jobs(self):
        """Setup scheduled jobs"""
        # Weather updates: 3 times daily (06:15, 12:15, 18:15 UK time)
        self.scheduler.add_job(
            func=self._run_weather_update,
            trigger=CronTrigger(hour=6, minute=15, timezone='Europe/London'),
            id='weather_morning',
            name='Weather Update - Morning'
        )
        
        self.scheduler.add_job(
            func=self._run_weather_update,
            trigger=CronTrigger(hour=12, minute=15, timezone='Europe/London'),
            id='weather_afternoon',
            name='Weather Update - Afternoon'
        )
        
        self.scheduler.add_job(
            func=self._run_weather_update,
            trigger=CronTrigger(hour=18, minute=15, timezone='Europe/London'),
            id='weather_evening',
            name='Weather Update - Evening'
        )
        
        # Tide data updates: Daily at 03:15 UK time
        self.scheduler.add_job(
            func=self._run_tide_update,
            trigger=CronTrigger(hour=3, minute=15, timezone='Europe/London'),
            id='tide_daily',
            name='Tide Data Update - Daily'
        )
        
        # Crossing times updates: Daily at 04:00 UK time
        self.scheduler.add_job(
            func=self._run_crossing_update,
            trigger=CronTrigger(hour=4, minute=0, timezone='Europe/London'),
            id='crossing_daily',
            name='Crossing Times Update - Daily'
        )
    
    def _run_weather_update(self):
        """Run weather data update"""
        try:
            self.logger.log('AUTOMATION', 'Starting scheduled weather update')
            result = self.weather_service.update_weather_data()
            self.logger.log('AUTOMATION', f'Weather update completed: {result}')
            
            # Send notification email
            admin_email = os.environ.get('ADMIN_EMAIL')
            if admin_email:
                self.email_service.send_update_notification(
                    admin_email, 'Weather', result
                )
                
        except Exception as e:
            self.logger.log('AUTOMATION', f'Weather update failed: {str(e)}', level='ERROR')
            
            # Send error email
            admin_email = os.environ.get('ADMIN_EMAIL')
            if admin_email:
                self.email_service.send_error_notification(
                    admin_email, 'Weather Update', str(e)
                )
    
    def _run_tide_update(self):
        """Run tide data update"""
        try:
            self.logger.log('AUTOMATION', 'Starting scheduled tide update')
            result = self.tide_service.update_tide_data()
            self.logger.log('AUTOMATION', f'Tide update completed: {result}')
            
            # Send notification email
            admin_email = os.environ.get('ADMIN_EMAIL')
            if admin_email:
                self.email_service.send_update_notification(
                    admin_email, 'Tide', result
                )
                
        except Exception as e:
            self.logger.log('AUTOMATION', f'Tide update failed: {str(e)}', level='ERROR')
            
            # Send error email
            admin_email = os.environ.get('ADMIN_EMAIL')
            if admin_email:
                self.email_service.send_error_notification(
                    admin_email, 'Tide Update', str(e)
                )
    
    def _run_crossing_update(self):
        """Run crossing times update"""
        try:
            self.logger.log('AUTOMATION', 'Starting scheduled crossing times update')
            result = self.crossing_service.update_crossing_data()
            self.logger.log('AUTOMATION', f'Crossing times update completed: {result}')
            
            # Send notification email
            admin_email = os.environ.get('ADMIN_EMAIL')
            if admin_email:
                self.email_service.send_update_notification(
                    admin_email, 'Crossing Times', result
                )
                
        except Exception as e:
            self.logger.log('AUTOMATION', f'Crossing times update failed: {str(e)}', level='ERROR')
            
            # Send error email
            admin_email = os.environ.get('ADMIN_EMAIL')
            if admin_email:
                self.email_service.send_error_notification(
                    admin_email, 'Crossing Times Update', str(e)
                )
    
    def start(self):
        """Start the automation system"""
        if not self.is_running:
            self.scheduler.start()
            self.is_running = True
            self.logger.log('AUTOMATION', 'Automation system started')
    
    def stop(self):
        """Stop the automation system"""
        if self.is_running:
            self.scheduler.shutdown()
            self.is_running = False
            self.logger.log('AUTOMATION', 'Automation system stopped')
    
    def get_status(self):
        """Get automation system status"""
        return {
            'running': self.is_running,
            'jobs': [
                {
                    'id': job.id,
                    'name': job.name,
                    'next_run': job.next_run_time.isoformat() if job.next_run_time else None
                }
                for job in self.scheduler.get_jobs()
            ] if self.is_running else []
        }
    
    def get_script_status(self):
        """Get individual script status"""
        return {
            'weather': {
                'last_run': self.weather_service.get_last_run(),
                'status': 'active' if self.is_running else 'stopped'
            },
            'tide': {
                'last_run': self.tide_service.get_last_run(),
                'status': 'active' if self.is_running else 'stopped'
            },
            'crossing': {
                'last_run': self.crossing_service.get_last_run(),
                'status': 'active' if self.is_running else 'stopped'
            }
        }

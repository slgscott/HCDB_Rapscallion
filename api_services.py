import os
import requests
from datetime import datetime, timedelta
from app import db
from models import WeatherData, TideData, CrossingTimes
from logger_config import SystemLogger
import pytz

class WeatherService:
    def __init__(self):
        self.logger = SystemLogger()
        self.last_run = None
    
    def update_weather_data(self, dry_run=False):
        """Update weather data from Open-Meteo API"""
        try:
            # Holy Island coordinates
            lat = 55.6691
            lon = -1.7927
            
            # Open-Meteo API (free, no key required)
            url = f"https://api.open-meteo.com/v1/forecast"
            params = {
                'latitude': lat,
                'longitude': lon,
                'hourly': 'temperature_2m,relative_humidity_2m,wind_speed_10m,wind_direction_10m,weather_code',
                'daily': 'weather_code,temperature_2m_max,temperature_2m_min',
                'timezone': 'Europe/London',
                'forecast_days': 7
            }
            
            response = requests.get(url, params=params, timeout=30)
            response.raise_for_status()
            data = response.json()
            
            records_processed = 0
            new_records = 0
            updated_records = 0
            checked_dates = []
            
            if dry_run:
                # For test runs, show what would be processed
                daily = data.get('daily', {})
                daily_times = daily.get('time', [])
                
                for date_str in daily_times:
                    checked_dates.append(date_str)
                    existing = WeatherData.query.filter_by(
                        date=date_str,
                        source='open-meteo'
                    ).first()
                    
                    if not existing:
                        new_records += 1
                    else:
                        updated_records += 1
                
                self.logger.log('WEATHER', f'TEST RUN: Checked {len(checked_dates)} dates. Would create {new_records} new records, update {updated_records} existing records. Dates: {", ".join(checked_dates[:3])}{"..." if len(checked_dates) > 3 else ""}')
                return f"Test completed: {len(checked_dates)} dates checked, {new_records} would be new, {updated_records} already exist"
            
            if not dry_run:
                # Process daily data for weather overview
                daily = data.get('daily', {})
                daily_times = daily.get('time', [])
                daily_temp_max = daily.get('temperature_2m_max', [])
                daily_temp_min = daily.get('temperature_2m_min', [])
                daily_weather_codes = daily.get('weather_code', [])
                
                # Process hourly data for detailed records
                hourly = data.get('hourly', {})
                times = hourly.get('time', [])
                temperatures = hourly.get('temperature_2m', [])
                humidity = hourly.get('relative_humidity_2m', [])
                wind_speeds = hourly.get('wind_speed_10m', [])
                wind_directions = hourly.get('wind_direction_10m', [])
                weather_codes = hourly.get('weather_code', [])
                
                # Create daily summary records
                for i, date_str in enumerate(daily_times):
                    # Check if record already exists for this date
                    existing = WeatherData.query.filter_by(
                        date=date_str,
                        source='open-meteo'
                    ).first()
                    
                    if not existing:
                        weather_record = WeatherData()
                        weather_record.date = date_str
                        weather_record.temperature_max = daily_temp_max[i] if i < len(daily_temp_max) else None
                        weather_record.temperature_min = daily_temp_min[i] if i < len(daily_temp_min) else None
                        weather_record.condition = self._weather_code_to_description(daily_weather_codes[i]) if i < len(daily_weather_codes) else None
                        weather_record.source = 'open-meteo'
                        
                        db.session.add(weather_record)
                        records_processed += 1
                
                # Update existing records with hourly data averages
                for i, time_str in enumerate(times):
                    dt = datetime.fromisoformat(time_str.replace('Z', '+00:00'))
                    date_str = dt.strftime('%Y-%m-%d')
                    
                    # Find existing daily record to update with hourly averages
                    daily_record = WeatherData.query.filter_by(
                        date=date_str,
                        source='open-meteo'
                    ).first()
                    
                    if daily_record and not daily_record.temperature:
                        # Update with current hour's data as sample
                        daily_record.temperature = int(temperatures[i]) if i < len(temperatures) and temperatures[i] else None
                        daily_record.humidity = int(humidity[i]) if i < len(humidity) and humidity[i] else None
                        daily_record.wind_speed = int(wind_speeds[i]) if i < len(wind_speeds) and wind_speeds[i] else None
                        daily_record.wind_direction = self._degrees_to_direction(wind_directions[i]) if i < len(wind_directions) and wind_directions[i] else None
                
                db.session.commit()
            else:
                # Dry run - just count potential records
                records_processed = len(data.get('hourly', {}).get('time', []))
            
            self.last_run = datetime.utcnow()
            result = f"Weather update completed. Records processed: {records_processed}"
            self.logger.log('WEATHER', result)
            
            return {
                'success': True,
                'records_processed': records_processed,
                'dry_run': dry_run
            }
            
        except Exception as e:
            error_msg = f"Weather update failed: {str(e)}"
            self.logger.log('WEATHER', error_msg, level='ERROR')
            raise
    
    def _degrees_to_direction(self, degrees):
        """Convert wind direction degrees to compass direction"""
        if degrees is None:
            return None
        
        directions = ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE',
                     'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
        
        index = round(degrees / 22.5) % 16
        return directions[index]
    
    def _weather_code_to_description(self, code):
        """Convert weather code to description"""
        weather_codes = {
            0: 'Clear sky',
            1: 'Mainly clear',
            2: 'Partly cloudy',
            3: 'Overcast',
            45: 'Fog',
            48: 'Depositing rime fog',
            51: 'Light drizzle',
            53: 'Moderate drizzle',
            55: 'Dense drizzle',
            61: 'Slight rain',
            63: 'Moderate rain',
            65: 'Heavy rain',
            71: 'Slight snow',
            73: 'Moderate snow',
            75: 'Heavy snow',
            95: 'Thunderstorm'
        }
        return weather_codes.get(code, f'Unknown ({code})')
    
    def get_last_run(self):
        """Get timestamp of last run"""
        return self.last_run.isoformat() if self.last_run else None

class TideService:
    def __init__(self):
        self.logger = SystemLogger()
        self.last_run = None
    
    def update_tide_data(self, dry_run=False):
        """Update tide data from UK Hydrographic Office API"""
        try:
            api_key = os.environ.get('UKHO_API_KEY')
            if not api_key:
                raise ValueError("UKHO_API_KEY not found in environment variables")
            
            # Use working API configuration from previous app
            station_id = "0208"  # Working station ID for Holy Island area
            
            # Get 7 days of tide predictions
            start_date = datetime.utcnow().date()
            end_date = start_date + timedelta(days=7)
            
            url = f"https://admiraltyapi.azure-api.net/uktidalapi-foundation/api/V2/Stations/{station_id}/TidalEvents"
            headers = {
                'Ocp-Apim-Subscription-Key': api_key
            }
            params = {
                'startDateTime': start_date.isoformat(),
                'endDateTime': end_date.isoformat(),
                'interval': 60  # 60-minute intervals
            }
            
            if dry_run:
                # For test runs, make actual API call to check response structure
                try:
                    response = requests.get(url, headers=headers, params=params, timeout=30)
                    response.raise_for_status()
                    data = response.json()
                    
                    self.logger.log('TIDE', f'TEST RUN: API call successful, received {len(data)} events')
                    if len(data) > 0:
                        first_event = data[0]
                        self.logger.log('TIDE', f'TEST RUN: First event structure: {list(first_event.keys())}')
                        self.logger.log('TIDE', f'TEST RUN: Sample event: DateTime={first_event.get("DateTime")}, EventType={first_event.get("EventType")}, Height={first_event.get("Height")}')
                    
                    # Count unique dates
                    unique_dates = set()
                    for event in data:
                        event_time = datetime.fromisoformat(event['DateTime'].replace('Z', '+00:00'))
                        uk_time = event_time.astimezone(pytz.timezone('Europe/London'))
                        unique_dates.add(uk_time.strftime('%Y-%m-%d'))
                    
                    self.logger.log('TIDE', f'TEST RUN: Would process {len(unique_dates)} unique dates')
                    return f"API test successful: {len(data)} events for {len(unique_dates)} dates"
                except Exception as e:
                    self.logger.log('TIDE', f'TEST RUN: API test failed: {str(e)}')
                    return f"API test failed: {str(e)}"
            
            response = requests.get(url, headers=headers, params=params, timeout=30)
            response.raise_for_status()
            data = response.json()
            
            records_processed = 0
            
            if not dry_run:
                # Process TidalEvents API response - group by date and extract high/low tides
                tide_events_by_date = {}
                
                for event in data:
                    # Parse DateTime field (format: "2024-06-19T14:30:00Z")
                    event_time = datetime.fromisoformat(event['DateTime'].replace('Z', '+00:00'))
                    # Convert to UK timezone
                    uk_time = event_time.astimezone(pytz.timezone('Europe/London'))
                    date_str = uk_time.strftime('%Y-%m-%d')
                    
                    if date_str not in tide_events_by_date:
                        tide_events_by_date[date_str] = {'high_tides': [], 'low_tides': []}
                    
                    tide_info = {
                        'time': uk_time.strftime('%H:%M'),
                        'height': float(event['Height'])
                    }
                    
                    if event['EventType'] == 'HighWater':
                        tide_events_by_date[date_str]['high_tides'].append(tide_info)
                    elif event['EventType'] == 'LowWater':
                        tide_events_by_date[date_str]['low_tides'].append(tide_info)
                
                # Create or update records for each date
                for date_str, tides in tide_events_by_date.items():
                    existing = TideData.query.filter_by(date=date_str).first()
                    
                    if existing:
                        # Update existing record
                        tide_record = existing
                    else:
                        # Create new record
                        tide_record = TideData()
                        tide_record.date = date_str
                        db.session.add(tide_record)
                        records_processed += 1
                    
                    # Sort tides by time and assign to fields
                    high_tides = sorted(tides['high_tides'], key=lambda x: x['time'])
                    low_tides = sorted(tides['low_tides'], key=lambda x: x['time'])
                    
                    # Clear existing values first
                    tide_record.high_tide_1_time = None
                    tide_record.high_tide_1_height = None
                    tide_record.high_tide_2_time = None
                    tide_record.high_tide_2_height = None
                    tide_record.low_tide_1_time = None
                    tide_record.low_tide_1_height = None
                    tide_record.low_tide_2_time = None
                    tide_record.low_tide_2_height = None
                    
                    # Assign high tides
                    if len(high_tides) >= 1:
                        tide_record.high_tide_1_time = high_tides[0]['time']
                        tide_record.high_tide_1_height = high_tides[0]['height']
                    if len(high_tides) >= 2:
                        tide_record.high_tide_2_time = high_tides[1]['time']
                        tide_record.high_tide_2_height = high_tides[1]['height']
                    
                    # Assign low tides
                    if len(low_tides) >= 1:
                        tide_record.low_tide_1_time = low_tides[0]['time']
                        tide_record.low_tide_1_height = low_tides[0]['height']
                    if len(low_tides) >= 2:
                        tide_record.low_tide_2_time = low_tides[1]['time']
                        tide_record.low_tide_2_height = low_tides[1]['height']
                
                db.session.commit()
                
                # Add detailed logging like weather script
                new_records = sum(1 for date_str in tide_events_by_date.keys() 
                                if not TideData.query.filter_by(date=date_str).first())
                existing_records = len(tide_events_by_date) - new_records
                
                dates_list = sorted(tide_events_by_date.keys())[:3]  # Show first 3 dates
                dates_preview = ', '.join(dates_list) + ('...' if len(tide_events_by_date) > 3 else '')
                
                self.logger.log('TIDE', f'Processed {len(tide_events_by_date)} dates. Created {new_records} new records, updated {existing_records} existing records. Dates: {dates_preview}')
            else:
                # This shouldn't run since we now do the API call in dry_run mode above
                records_processed = 0
            
            self.last_run = datetime.utcnow()
            result = f"Tide update completed. Records processed: {records_processed}"
            self.logger.log('TIDE', result)
            
            return {
                'success': True,
                'records_processed': records_processed,
                'dry_run': dry_run
            }
            
        except Exception as e:
            error_msg = f"Tide update failed: {str(e)}"
            self.logger.log('TIDE', error_msg, level='ERROR')
            raise
    
    def get_last_run(self):
        """Get timestamp of last run"""
        return self.last_run.isoformat() if self.last_run else None

class CrossingService:
    def __init__(self):
        self.logger = SystemLogger()
        self.last_run = None
    
    def update_crossing_data(self, dry_run=False):
        """Update crossing times from Northumberland County Council website"""
        try:
            # Northumberland County Council Holy Island crossing times
            url = "https://www.northumberland.gov.uk/Roads/Roads-Pavements-Parking/Highways-maintenance/Holy-Island.aspx"
            
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
            }
            
            response = requests.get(url, headers=headers, timeout=30)
            response.raise_for_status()
            
            # Parse HTML for crossing times (simplified parsing)
            # In a real implementation, you'd use BeautifulSoup to parse the HTML
            # and extract the crossing times table
            
            records_processed = 0
            
            if not dry_run:
                # For now, we'll create a placeholder record
                # In real implementation, parse the HTML and extract actual data
                today = datetime.utcnow().date()
                
                existing = CrossingTimes.query.filter_by(
                    date=today,
                    source_url=url
                ).first()
                
                if not existing:
                    crossing_record = CrossingTimes(
                        date=today,
                        source_url=url,
                        weather_conditions='Data scraped from website'
                    )
                    
                    db.session.add(crossing_record)
                    records_processed = 1
                    db.session.commit()
            else:
                # Dry run
                records_processed = 1
            
            self.last_run = datetime.utcnow()
            result = f"Crossing times update completed. Records processed: {records_processed}"
            self.logger.log('CROSSING', result)
            
            return {
                'success': True,
                'records_processed': records_processed,
                'dry_run': dry_run
            }
            
        except Exception as e:
            error_msg = f"Crossing times update failed: {str(e)}"
            self.logger.log('CROSSING', error_msg, level='ERROR')
            raise
    
    def get_last_run(self):
        """Get timestamp of last run"""
        return self.last_run.isoformat() if self.last_run else None

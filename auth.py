import os
from functools import wraps
from flask import session, redirect, url_for, flash
from werkzeug.security import generate_password_hash, check_password_hash
from app import db
from models import Users

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not session.get('logged_in'):
            flash('Please log in to access this page', 'error')
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

def check_auth(username=None, password=None):
    if username and password:
        user = Users.query.filter_by(username=username).first()
        if user and check_password_hash(user.password, password):
            return True
        return False
    else:
        return session.get('logged_in', False)

def create_admin_user(username, password, email=None):
    """Create a new admin user"""
    existing_user = Users.query.filter_by(username=username).first()
    if existing_user:
        return False
    
    password_hash = generate_password_hash(password)
    user = Users(
        username=username,
        password=password_hash
    )
    
    db.session.add(user)
    db.session.commit()
    return True

def change_password(username, old_password, new_password):
    """Change user password"""
    user = Users.query.filter_by(username=username).first()
    if not user or not check_password_hash(user.password, old_password):
        return False
    
    user.password = generate_password_hash(new_password)
    db.session.commit()
    return True

"""
HCDB_Rapscallion Version Management
"""

VERSION = "1.0.8"

def get_version():
    """Get the current application version"""
    return VERSION

def update_version(new_version):
    """Update the version number (for code freeze updates)"""
    global VERSION
    VERSION = new_version
    
    # Update this file with the new version
    with open(__file__, 'r') as f:
        content = f.read()
    
    # Replace the VERSION line
    lines = content.split('\n')
    for i, line in enumerate(lines):
        if line.startswith('VERSION = '):
            lines[i] = f'VERSION = "1.0.5"'
            break
    
    with open(__file__, 'w') as f:
        f.write('\n'.join(lines))
    
    return new_version
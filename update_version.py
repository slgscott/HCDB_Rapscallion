#!/usr/bin/env python3
"""
Version update utility for HCDB_Rapscallion
Usage: python update_version.py <new_version>
Example: python update_version.py 1.1.0
"""

import sys
import re

def update_version(new_version):
    """Update the version in version.py"""
    if not re.match(r'^\d+\.\d+\.\d+$', new_version):
        print(f"Error: Version must be in format X.Y.Z (e.g., 1.0.0)")
        return False
    
    try:
        # Read current version.py
        with open('version.py', 'r') as f:
            content = f.read()
        
        # Update VERSION line
        updated_content = re.sub(
            r'VERSION = "[^"]*"',
            f'VERSION = "{new_version}"',
            content
        )
        
        # Write back to file
        with open('version.py', 'w') as f:
            f.write(updated_content)
        
        print(f"Version updated to {new_version}")
        return True
        
    except Exception as e:
        print(f"Error updating version: {e}")
        return False

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python update_version.py <new_version>")
        print("Example: python update_version.py 1.1.0")
        sys.exit(1)
    
    new_version = sys.argv[1]
    if update_version(new_version):
        sys.exit(0)
    else:
        sys.exit(1)
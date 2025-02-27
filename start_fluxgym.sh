#!/bin/bash

# Parse command line arguments
for arg in "$@"; do
  case $arg in
    --check-updates)
      # Keeping this for backward compatibility, but it doesn't do anything special now
      shift
      ;;
    *)
      # Unknown option
      ;;
  esac
done

# Always check for updates
echo "Checking for updates..."
git pull origin main || git pull origin master || echo "Warning: Could not update repository."

# Update sd-scripts if it exists
if [ -d "sd-scripts" ]; then
  echo "Updating sd-scripts repository..."
  cd sd-scripts
  git pull origin sd3
  cd ..
fi

# Activate the virtual environment
if [ -d "env" ]; then
    source env/bin/activate
else
    echo "Error: Virtual environment not found. Please run the installation script first."
    exit 1
fi

# Start Fluxgym
echo "Starting Fluxgym..."
python app.py 
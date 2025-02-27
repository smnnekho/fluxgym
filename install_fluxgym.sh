#!/bin/bash

# Exit on error
set -e

echo "=== Flux Gym Installation Script ==="
echo "This script will install Flux Gym and all its dependencies."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3 and try again."
    exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and try again."
    exit 1
fi

# Update the repository
echo "Updating FluxGym repository..."
git pull origin main || git pull origin master || echo "Warning: Could not update repository. Continuing with installation..."

# Clone sd-scripts repository if it doesn't exist
if [ ! -d "sd-scripts" ]; then
    echo "Cloning sd-scripts repository..."
    git clone -b sd3 https://github.com/kohya-ss/sd-scripts
else
    # Update sd-scripts if it exists
    echo "Updating sd-scripts repository..."
    cd sd-scripts
    git pull origin sd3
    cd ..
fi

# Create and activate virtual environment
echo "Creating virtual environment..."
python3 -m venv env
source env/bin/activate

# Install sd-scripts dependencies
echo "Installing sd-scripts dependencies..."
cd sd-scripts
pip install -r requirements.txt

# Return to fluxgym root directory
cd ..

# Install fluxgym dependencies
echo "Installing fluxgym dependencies..."
pip install -r requirements.txt

# Install PyTorch Nightly
echo "Installing PyTorch Nightly..."
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# Make start script executable
if [ -f "start_fluxgym.sh" ]; then
    echo "Making start script executable..."
    chmod +x start_fluxgym.sh
fi

echo "=== Installation Complete ==="
echo "To start Flux Gym, run the following commands:"
echo "source env/bin/activate"
echo "python app.py"
echo ""
echo "Or use the start script:"
echo "./start_fluxgym.sh"
echo "To check for updates before starting, run: ./start_fluxgym.sh --check-updates" 
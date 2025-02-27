# FluxGym Linux Scripts

This directory contains scripts to help you install and run FluxGym on Linux systems.

## Installation Script

The `install_fluxgym.sh` script automates the installation process for FluxGym. It:

1. Updates the FluxGym repository with the latest changes
2. Clones or updates the sd-scripts repository
3. Sets up a Python virtual environment
4. Installs all required dependencies
5. Makes the start script executable

### Usage

```bash
# Make the script executable
chmod +x install_fluxgym.sh

# Run the installation script
./install_fluxgym.sh
```

## Start Script

After installation, you can use the `start_fluxgym.sh` script to launch FluxGym:

```bash
# Start FluxGym
./start_fluxgym.sh

# Or, to check for updates before starting
./start_fluxgym.sh --check-updates
```

The `--check-updates` flag will pull the latest changes from both the FluxGym and sd-scripts repositories before starting the application.

## Requirements

- Linux operating system
- Python 3.x installed
- Git installed
- Internet connection for downloading dependencies

## Troubleshooting

If you encounter any issues:

1. Make sure Python 3 and Git are installed
2. Ensure you have sufficient disk space
3. Check that you have the necessary permissions to create directories and files
4. If you're behind a proxy, make sure your git and pip configurations are set correctly
5. If you get git errors, try running the installation script with the `--check-updates` flag to force an update 
#!/bin/bash

INSTALLATION_FOLDER="$HOME/Documents/py-projects/"
REPO_URL="https://github.com/perites/Copy-Helper"
REPO_NAME="Copy-Helper"

# Create installation folder if it doesn't exist
mkdir -p "$INSTALLATION_FOLDER"
cd "$INSTALLATION_FOLDER" || exit

# Clone or pull the latest changes
if [ -d "$REPO_NAME" ]; then
    echo "Repository exists. Pulling latest changes..."
    cd "$REPO_NAME" || exit
    git pull
else
    echo "Cloning repository..."
    git clone "$REPO_URL"
    cd "$REPO_NAME" || exit
fi


if [ ! -d ".venv" ]; then
    python3 -m venv .venv
else
    echo ".venv already exists. Skipping virtual environment creation."
fi
  
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the application
python copy_helper_app.py

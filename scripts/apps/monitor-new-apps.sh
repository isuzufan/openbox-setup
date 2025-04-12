#!/bin/bash

# Directory to monitor
SOURCE_DIR="/usr/share/applications"

# Directory to copy new files to
DEST_DIR="~/.local/share/applications"

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"


# Monitor the source directory for new files
inotifywait -m -e create --format '%w%f' "$SOURCE_DIR" | while read NEW_FILE
do
    # Copy only the new files to the destination directory
    cp "$NEW_FILE" "$DEST_DIR"
    echo "Copied $NEW_FILE to $DEST_DIR"
    
    # Open the copied file in the default text editor
    xdg-open "$DEST_DIR/$(basename "$NEW_FILE")"
    
    # Wait a moment to ensure the file is opened
    sleep 1
    
    # Resize and move the window to the right half of the screen
    wmctrl -r "$(basename "$NEW_FILE")" -e 0,960,0,960,1080
    
    # Open a half-screen yad window with a message on the left half of the screen
    yad --text="You have new software" --width=960 --height=1080 --posx=0 --posy=0
done

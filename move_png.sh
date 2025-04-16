#!/bin/bash

# Check if the image folder exists, if not, create it
if [ ! -d "images" ]; then
  mkdir images
fi

# Infinite loop to move .png files every second
while true; do
  # Loop through all .png files in the current directory
  for file in *.png; do
    # Check if the file exists (to handle case where no .png files are found)
    if [ -f "$file" ]; then
      # Move the file to the image directory
      mv "$file" images/
      echo "Moved: $file"
    fi
  done

  # Sleep for 1 second before checking again
  sleep 500
done


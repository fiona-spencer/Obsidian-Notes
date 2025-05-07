#!/bin/bash

# Check if a file was passed
if [ -z "$1" ]; then
  echo "Usage: $0 file.md"
  exit 1
fi

input_file="$1"
output_file="${input_file%.md}_converted.md"

# Use sed to replace Markdown image syntax with HTML img tag
sed -E 's|!\[\]\(([^)]+\.png)\)|<img src="/images/\1" alt="image" width="500">|g' "$input_file" > "$output_file"

echo "Converted file saved as: $output_file"


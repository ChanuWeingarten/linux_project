#!/bin/bash

# Validate input arguments
if [ $# -lt 2 ]; then
  echo "Usage: down_zip.sh <Target Directory> <Image URL1> [<Image URL2> ...]"
  exit 1
fi

# Validate Target Directory
if [ ! -d "$1" ]; then
  echo "Target Directory '$1' does not exist."
  exit 1
fi

# Create a temporary directory for downloads
temp_dir=$(mktemp -d)

# Download images
for ((i = 2; i <= $#; i++)); do
  url="${!i}"
  filename=$(basename "$url")
  if wget -q -P "$temp_dir" "$url"; then
    echo "Downloaded: $filename"
  else
    echo "Failed to download: $filename"
  fi
done

# Create archive with current time as the name
archive_name=$(date +'%Y%m%d%H%M%S').zip
archive_path="$1/$archive_name"

# Check if 'zip' command is available
if ! command -v zip &>/dev/null; then
  echo "Error: 'zip' command not found."
  echo "Please install 'zip' and try again."
  exit 1
fi

# Create the archive
if zip -r "$archive_path" "$temp_dir" &>/dev/null; then
  echo "Archive created: $archive_name"
else
  echo "Failed to create archive: $archive_name"
  exit 1
fi

# Clean up temporary directory
rm -rf "$temp_dir"

echo "Process completed successfully."

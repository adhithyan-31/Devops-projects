#!/bin/bash

# -----------------------------
# Log Archive Tool
# -----------------------------

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: log-archive <log-directory>"
  exit 1
fi

LOG_DIR=$1

# Check if directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory does not exist."
  exit 1
fi

# Create archive directory if not exists
ARCHIVE_DIR="$HOME/log_archives"
mkdir -p "$ARCHIVE_DIR"

# Get current date and time
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive file name
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Create tar.gz archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR"

# Log archive details
echo "[$(date)] Archived $LOG_DIR to $ARCHIVE_NAME" >> "$ARCHIVE_DIR/archive.log"

echo "✅ Logs archived successfully!"
echo "📦 Archive created at: $ARCHIVE_DIR/$ARCHIVE_NAME"

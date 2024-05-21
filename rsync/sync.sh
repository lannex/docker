#!/bin/sh

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
  echo "SOURCE_DIR and DEST_DIR must be set"
  exit 1
fi

while true; do
  rsync -av --delete "$SOURCE_DIR" "$DEST_DIR"
  sleep $SLEEP
done


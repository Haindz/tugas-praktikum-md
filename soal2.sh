#!/bin/bash

SOURCE="$HOME/data"
DEST="$HOME/backup"

mkdir -p "$DEST"

END_TIME=$((SECONDS + 3600))
INDEX=1

while [ $SECONDS -lt $END_TIME ]; do
    FILENAME="$DEST/file$INDEX.tar.gz"

    tar -czf "$FILENAME" "$SOURCE"

    echo "Backup ke-$INDEX disimpan di $FILENAME pada $(date)"

    INDEX=$((INDEX + 1))
    if [ $INDEX -gt 10 ]; then
        INDEX=1
    fi

    sleep 15
done

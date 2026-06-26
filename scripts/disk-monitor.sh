#!/bin/bash

echo "============== DISK USAGE ============"

DISK_USAGE=$(df / | awk 'END {gsub("%","",$5); print $5}')

echo "$(date) | Disk Usage: $DISK_USAGE" >> ../logs/monitoring.log

echo "Disk usage = $DISK_USAGE%"


if [ "$DISK_USAGE" -gt 60 ]
then
    ./scripts/alert-manager.sh "Disk Usage Critical: $DISK_USAGE%"
fi

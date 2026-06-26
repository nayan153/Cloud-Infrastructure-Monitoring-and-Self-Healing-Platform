#!/bin/bash

echo "========== MEMORY USAGE CALCULATION ==========="
MEMORY_USAGE=$(free | grep Mem | awk '{print int(($3/$2) * 100)}')

echo "$(date) | Memory Usage: ${MEMORY_USAGE}%" >> ../logs/monitoring.log



echo "Memory Usage: $MEMORY_USAGE%"

if [ "$MEMORY_USAGE" -gt 60 ]
then
    ./alert-manager.sh "High Memory Usage: $MEMORY_USAGE%"
fi

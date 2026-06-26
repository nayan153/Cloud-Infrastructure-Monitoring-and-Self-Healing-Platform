#!/bin/bash

echo "========== CPU USAGE CALCULATION =============="

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int(100 - $8)}')

echo "$(date) | CPU Usage: $CPU_USAGE%" >> ../logs/monitoring.log

echo " CPU USAGE = $CPU_USAGE%"
if [ "$CPU_USAGE" -gt 60 ]
then
    ./alert-manager.sh "High CPU Usage: $CPU_USAGE%"
fi



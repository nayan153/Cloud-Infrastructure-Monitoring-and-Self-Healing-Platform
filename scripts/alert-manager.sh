#!/bin/bash

# Log file location
LOG_FILE="/home/ubuntu/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/logs/alerts.log"

# Self-healing script
SELF_HEAL_SCRIPT="/home/ubuntu/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/scripts/self-heal.sh"

# Thresholds
CPU_THRESHOLD=60
MEMORY_THRESHOLD=60
DISK_THRESHOLD=65

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# -------------------------
# CPU Usage
# -------------------------
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: CPU usage is ${CPU_USAGE}%." >> "$LOG_FILE"
    bash "$SELF_HEAL_SCRIPT"
fi

# -------------------------
# Memory Usage
# -------------------------
MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: Memory usage is ${MEMORY_USAGE}%." >> "$LOG_FILE"
fi

# -------------------------
# Disk Usage
# -------------------------
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: Disk usage is ${DISK_USAGE}%." >> "$LOG_FILE"
fi

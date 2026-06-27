#!/bin/bash

LOG_FILE="/home/ubuntu/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/logs/self-healing.log"

SERVICE="grafana-server"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if ! systemctl is-active --quiet $SERVICE
then
    echo "[$TIMESTAMP] $SERVICE is down. Attempting to restart..." >> "$LOG_FILE"

    sudo systemctl restart $SERVICE

    sleep 2

    if systemctl is-active --quiet $SERVICE
    then
        echo "[$TIMESTAMP] $SERVICE restarted successfully." >> "$LOG_FILE"
    else
        echo "[$TIMESTAMP] Failed to restart $SERVICE." >> "$LOG_FILE"
    fi
fi

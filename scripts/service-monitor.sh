#!/bin/bash

SERVICE="ssh"

echo "========= SERVICE MONITOR ========="
STATUS=$(systemctl is-active $SERVICE)

echo "$(date) | Service ($SERVICE): $STATUS" >> ../logs/monitoring.log

echo "Status = $STATUS"

if [ "$STATUS" != "active" ]
then
    ./alert-manager.sh "$SERVICE service is down"
fi

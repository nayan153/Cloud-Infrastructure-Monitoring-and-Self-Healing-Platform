#!/bin/bash

echo "======== ALERT MESSAGE ======== "
MESSAGE=$1

echo "$(date) | ALERT | $MESSAGE" >> ../logs/alerts.log

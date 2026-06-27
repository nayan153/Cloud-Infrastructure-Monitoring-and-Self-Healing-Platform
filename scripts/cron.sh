#!/bin/bash
*/15 * * * * /home/nayan/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/scripts/alert-manager.sh
sleep 20s
*/15 * * * * /home/nayan/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/scripts/monitor.sh         
sleep 20s
*/15 * * * * /home/nayan/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/scripts/self-heal.sh
sleep 20s
*/15 * * * * /home/nayan/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/scripts/log-backup.sh


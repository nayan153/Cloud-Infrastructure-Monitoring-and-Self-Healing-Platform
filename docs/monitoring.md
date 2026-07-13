# Monitoring Platform

## Overview

This project uses custom Bash scripts to monitor the health of the EC2 instance.

The monitoring platform checks CPU usage, memory usage, disk usage, and important system services. The collected information is written to log files for later review.

---

## Monitoring Scripts

The monitoring platform includes the following scripts:

* CPU monitoring
* Memory monitoring
* Disk monitoring
* Service monitoring
* Alert manager
* Self-healing
* Log backup

A main script (`monitor.sh`) runs these scripts together.

---

## Automation

The monitoring process is automated using Cron.

The main monitoring script runs every five minutes without any manual action.

---

## Verification

I tested each monitoring script individually before enabling Cron.

After enabling automation, I confirmed that new log entries were being added automatically.

---

## Result

The monitoring platform is now running continuously on the EC2 instance and collecting system information automatically.


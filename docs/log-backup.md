# Log Backup

## Overview

The monitoring platform generates log files continuously. To avoid losing important information, a backup script is used to create copies of these logs.

The backup process helps preserve monitoring history and provides a simple way to review previous server events.

---

## Files Included

The following log files are backed up:

* monitoring.log
* alerts.log
* self-healing.log

The backup files are stored in the `backup/logs` directory.

---

## Backup Process

The backup script copies the latest log files into the backup folder.

The script can be executed manually or scheduled using Cron for automatic backups.

---

## Verification

After running the backup script, I verified that the log files were copied successfully to the backup directory.

The backup folder contained copies of all monitoring logs.

---

## Result

The project now includes a simple log backup system that helps preserve monitoring records for future reference.


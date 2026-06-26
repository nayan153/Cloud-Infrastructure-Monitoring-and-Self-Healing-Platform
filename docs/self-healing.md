# Self-Healing

## Overview

The Self-Healing module helps the monitoring platform recover from simple service failures automatically.

Instead of waiting for manual intervention, the script checks the status of important services and restarts them when required.

---

## Recovery Process

The self-healing script works after an alert is generated.

It checks the affected service and performs a recovery action if possible. Every action is recorded in a separate log file for future reference.

---

## Current Recovery Actions

The current version of the script can:

* Restart the Apache web server if it stops.
* Record the recovery action in a log file.
* Confirm whether the restart was successful.

More recovery actions can be added in the future as the project grows.

---

## Recovery Log

All recovery actions are stored in:

```text
logs/self-healing.log
```

Each log entry includes the date, time, affected service, and recovery status.

---

## Verification

To test the self-healing process, I manually stopped the Apache service and executed the self-healing script.

The script restarted the service successfully and created a new entry in the recovery log.

---

## Result

The monitoring platform can now detect basic service failures and recover automatically without manual intervention.


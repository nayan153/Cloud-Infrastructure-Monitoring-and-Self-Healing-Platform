# Alert Manager

## Overview

The Alert Manager is responsible for detecting unusual system activity on the server.

It checks the output from the monitoring scripts and compares the values with predefined thresholds. If any value goes beyond the safe limit, an alert is generated and saved to a log file. This makes it easier to identify problems before they affect the server.

---

## What It Monitors

The Alert Manager currently checks:

* CPU usage
* Memory usage
* Disk usage

Each resource has its own threshold value. If the current usage is higher than the threshold, an alert is created.

---

## Alert Thresholds

| Resource     | Threshold |
| ------------ | --------- |
| CPU Usage    | 60%       |
| Memory Usage | 60%       |
| Disk Usage   | 60%       |

These values can be changed easily depending on the server requirements.

---

## Alert Log

Whenever an alert is generated, it is stored in the following file:

```text
logs/alerts.log
```

Each log entry contains:

* Date and time
* Resource name
* Current usage
* Alert message

Example:

```text
[2026-06-26 10:15:04] ALERT: CPU usage is 91%
[2026-06-26 10:18:20] ALERT: Disk usage is 87%
```

---

## How It Works

1. The monitoring scripts collect the latest system information.
2. The Alert Manager checks each value against its threshold.
3. If a threshold is exceeded, an alert is written to `alerts.log`.
4. The Self-Healing module can use these alerts to perform recovery actions when needed.

---

## Verification

To verify that the Alert Manager was working correctly, I ran the monitoring scripts and checked the alert log.

```bash
cat logs/alerts.log
```

Whenever the system crossed a configured threshold, a new alert was added to the log file.

---

## Result

The Alert Manager successfully detects high resource usage and records alerts automatically. This provides a simple way to monitor server health and helps identify issues before they become critical.


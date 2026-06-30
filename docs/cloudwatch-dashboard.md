# CloudWatch Dashboard

## Overview

To monitor the EC2 instance from the AWS Management Console, I created a custom CloudWatch Dashboard.

The dashboard displays important system metrics in one place, making it easier to understand the health of the server without connecting through SSH.

---

## Dashboard Widgets

The dashboard includes the following metrics:

* CPU Utilization
* Memory Usage
* Disk Usage
* Network In
* Network Out
* EC2 Status Check

These metrics provide a quick overview of the server's current performance.

---

## Dashboard Configuration

The dashboard uses both default EC2 metrics and custom metrics collected by the Amazon CloudWatch Agent.

The dashboard configuration is saved in:

```text
cloudwatch/cloudwatch-dashboard.json
```

This file can be imported into another AWS account to recreate the same dashboard.

---

## Verification

After creating the dashboard, I confirmed that all widgets were receiving live data from the EC2 instance.

I also exported the dashboard configuration and added it to the project repository.

---

## Result

The CloudWatch Dashboard provides a simple and centralized view of the EC2 instance. It complements the Grafana dashboard and offers native AWS monitoring for the project.


# Amazon CloudWatch Agent

## Overview

To monitor the EC2 instance using AWS services, I installed the Amazon CloudWatch Agent.

The CloudWatch Agent collects system metrics and log files from the server and sends them to Amazon CloudWatch. This makes it possible to monitor the server directly from the AWS Management Console.

---

## Metrics Collected

The CloudWatch Agent is configured to collect:

* CPU usage
* Memory usage
* Disk usage
* Disk utilization

These metrics help monitor the overall health of the EC2 instance.

---

## Log Collection

In addition to system metrics, the CloudWatch Agent also sends application log files to CloudWatch Logs.

The following logs are collected:

* monitoring.log
* alerts.log
* self-healing.log

This makes it easier to review server activity without logging into the EC2 instance.

---

## Verification

After starting the CloudWatch Agent, I confirmed that it was running successfully using:

```bash
sudo systemctl status amazon-cloudwatch-agent
```

I also verified that metrics and log groups appeared in the Amazon CloudWatch console.

---

## Result

The EC2 instance now sends both system metrics and application logs to Amazon CloudWatch. This provides an additional monitoring layer alongside Prometheus and Grafana.


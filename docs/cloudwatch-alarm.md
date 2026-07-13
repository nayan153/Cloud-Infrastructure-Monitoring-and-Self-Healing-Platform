# CloudWatch Alarm

## Overview

CloudWatch Alarms continuously monitor selected AWS metrics and compare them against a configured threshold.

If the metric crosses the threshold, the alarm changes its state and performs an action such as sending a notification through Amazon SNS.

---

## Alarm Configuration

For this project, a CloudWatch Alarm was created to monitor EC2 CPU utilization.

Current configuration:

* Metric: CPUUtilization
* Threshold: Greater than 80%
* Evaluation Period: 5 Minutes
* Action: Send notification to Amazon SNS

---

## Verification

The alarm was tested by creating CPU load on the EC2 instance.

After the threshold was exceeded, the alarm changed from **OK** to **ALARM**, and an email notification was sent through Amazon SNS.

---

## Result

CloudWatch Alarms provide automatic monitoring of AWS resources and help notify administrators before resource usage becomes a serious issue.


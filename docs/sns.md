# Amazon SNS Notification

## Overview

To receive notifications when a CloudWatch Alarm is triggered, I integrated Amazon Simple Notification Service (SNS) into the project.

Whenever the monitored EC2 instance crosses the configured threshold, CloudWatch sends a notification to an SNS topic. SNS then delivers the notification to my email address.

---

## SNS Topic

A Standard SNS topic was created for monitoring alerts.

The topic receives messages from CloudWatch Alarms and forwards them to subscribed email addresses.

---

## Email Subscription

An email subscription was added to the SNS topic.

After confirming the subscription, the email address became available to receive alarm notifications.

---

## CloudWatch Alarm

The SNS topic is connected to a CloudWatch Alarm that monitors the EC2 instance.

When CPU usage exceeds the configured threshold, the alarm changes to the **ALARM** state and CloudWatch automatically sends a notification through SNS.

---

## Verification

To test the notification, I generated CPU load on the EC2 instance.

After the CPU usage exceeded the configured threshold, the CloudWatch Alarm entered the **ALARM** state and an email notification was successfully delivered.

---

## Result

The monitoring platform can now notify administrators automatically when important system metrics exceed their configured limits. This helps identify issues quickly without continuously monitoring the dashboard.


# Project Overview

## Introduction

Cloud Infrastructure Monitoring & Self-Healing Platform is a cloud-based monitoring project built on AWS. The project is designed to monitor the health of an Ubuntu EC2 instance, detect common system issues, and perform basic recovery actions automatically.

The main idea behind this project is to understand how cloud monitoring works in a real environment by combining custom Bash scripts with AWS services.

---

## Project Objective

The goal of this project is to build a monitoring platform that can:

- Monitor server health continuously.
- Track CPU, memory, disk, and service status.
- Generate alerts when resource usage crosses predefined limits.
- Restart selected services automatically when they stop.
- Collect and visualize system metrics.
- Use AWS services for cloud-based monitoring and notifications.

---

## Problem Statement

Managing cloud servers manually becomes difficult as the number of servers grows. Administrators need a simple way to monitor system health, identify problems quickly, and receive notifications when something goes wrong.

Without proper monitoring, issues such as high CPU usage, low disk space, or stopped services may remain unnoticed until they affect users.

This project was built to understand how monitoring and basic automation can help improve server availability.

---

## Solution

To solve this problem, I built a monitoring platform that combines Linux automation with AWS monitoring services.

The platform checks the server at regular intervals using Bash scripts. It records important system information, generates alerts when required, and performs basic recovery actions for selected services.

To improve monitoring, Node Exporter sends system metrics to Prometheus, and Grafana displays those metrics using dashboards. At the same time, Amazon CloudWatch collects system metrics and logs, while CloudWatch Alarms and Amazon SNS notify the administrator whenever a configured threshold is exceeded.

---

## Project Workflow

The monitoring platform follows the workflow shown below.

```text
Ubuntu EC2
     │
     ▼
Monitoring Scripts
     │
     ▼
Alert Manager
     │
     ▼
Self-Healing
     │
     ▼
Log Files
     │
     ▼
CloudWatch Agent
     │
     ▼
Amazon CloudWatch
     │
     ▼
CloudWatch Alarm
     │
     ▼
Amazon SNS
     │
     ▼
Email Notification
```

At the same time:

```text
Ubuntu EC2
     │
     ▼
Node Exporter
     │
     ▼
Prometheus
     │
     ▼
Grafana Dashboard
```

---

## AWS Services Used

| Service | Purpose |
|----------|---------|
| Amazon EC2 | Hosts the monitoring platform |
| IAM Role | Securely allows the EC2 instance to access AWS services |
| Amazon CloudWatch | Collects metrics and log data |
| CloudWatch Dashboard | Displays AWS monitoring metrics |
| CloudWatch Alarm | Detects threshold breaches |
| Amazon SNS | Sends email notifications |

---

## Tools and Technologies

- AWS EC2
- Ubuntu Server
- Bash Scripting
- Cron
- Node Exporter
- Prometheus
- Grafana
- Amazon CloudWatch
- Amazon SNS
- Git & GitHub

---

## Main Features

- Continuous server monitoring
- CPU, memory, and disk usage monitoring
- Service health monitoring
- Automatic alert generation
- Basic self-healing
- Log management and backup
- Prometheus metrics collection
- Grafana dashboards
- CloudWatch integration
- Email notifications using Amazon SNS

---

## Project Outcome

After completing this project, I gained practical experience with cloud infrastructure monitoring on AWS.

The project helped me understand how Linux monitoring tools and AWS services work together to build a monitoring solution. It also improved my understanding of automation, system administration, and cloud operations.

---

## Future Scope

There are several improvements that can be added in future versions of the project.

Some planned enhancements include:

- Monitor multiple EC2 instances.
- Create custom Grafana dashboards.
- Containerize the platform using Docker.
- Deploy using Kubernetes.
- Provision infrastructure using Terraform.
- Integrate Slack or Microsoft Teams notifications.
- Build a CI/CD pipeline using GitHub Actions.

---

## Conclusion

This project gave me hands-on experience with AWS, Linux administration, monitoring tools, and automation. Instead of learning each tool separately, I combined them into a single project to understand how they work together in a cloud environment.

It also helped me improve my documentation skills and taught me how to organize a cloud project in a professional GitHub repository.

# Interview Questions

This document contains some common interview questions based on this project. These questions helped me revise the concepts used while building the monitoring platform.

---

# Project Overview

### 1. Tell me about your project.

**Answer:**

I built a cloud-based monitoring platform on an Ubuntu EC2 instance in AWS. The project monitors CPU, memory, disk usage, and important services using Bash scripts. It also collects system metrics through Node Exporter, stores them in Prometheus, and displays them in Grafana. In addition, I integrated AWS services like CloudWatch, IAM Roles, CloudWatch Alarms, and Amazon SNS to monitor the server and send email notifications when a threshold is exceeded.

---

### 2. Why did you build this project?

**Answer:**

I wanted to gain practical experience with cloud monitoring and AWS services. Instead of learning each tool separately, I combined them into a single project to understand how monitoring, alerting, and automation work together.

---

### 3. What problem does this project solve?

**Answer:**

The project helps monitor the health of a cloud server, detects high resource usage, generates alerts, and performs basic recovery actions automatically. This reduces manual monitoring and improves server availability.

---

# AWS EC2

### 4. Why did you choose EC2?

**Answer:**

EC2 provides a virtual server where I could deploy and manage the complete monitoring platform. It allowed me to configure the operating system, install monitoring tools, and integrate AWS services.

---

### 5. Why did you choose Ubuntu?

**Answer:**

Ubuntu has good community support, simple package management, and is commonly used for cloud servers. Most monitoring tools provide official installation guides for Ubuntu.

---

### 6. What is a Security Group?

**Answer:**

A Security Group acts as a virtual firewall for an EC2 instance. It controls inbound and outbound traffic by allowing or denying connections based on rules.

---

# Bash Monitoring

### 7. What does your monitoring script check?

**Answer:**

The monitoring script checks CPU usage, memory usage, disk usage, and important services. It records the results in log files and passes the information to the Alert Manager.

---

### 8. Why did you use Cron?

**Answer:**

Cron automatically runs the monitoring script at regular intervals, so the server is monitored continuously without manual execution.

---

# Alert Manager

### 9. What is the purpose of the Alert Manager?

**Answer:**

The Alert Manager compares monitored values with predefined thresholds. If any value exceeds the threshold, it creates an alert and stores it in the alert log.

---

# Self-Healing

### 10. What is self-healing?

**Answer:**

Self-healing is the process of automatically recovering from common failures. In this project, the script checks important services and restarts them if they stop unexpectedly.

---

# Node Exporter

### 11. What is Node Exporter?

**Answer:**

Node Exporter collects system metrics such as CPU, memory, disk, network usage, and uptime. It exposes these metrics so that Prometheus can collect them.

---

# Prometheus

### 12. What is Prometheus?

**Answer:**

Prometheus is a monitoring tool that collects and stores time-series metrics from Node Exporter. It periodically scrapes metrics and stores them for analysis.

---

### 13. Why do we need Prometheus if Node Exporter already provides metrics?

**Answer:**

Node Exporter only exposes metrics. Prometheus collects those metrics, stores them, and makes them available for dashboards and monitoring.

---

# Grafana

### 14. Why did you use Grafana?

**Answer:**

Grafana provides dashboards that display metrics collected by Prometheus. It makes it easier to monitor system performance using graphs instead of raw data.

---

# CloudWatch

### 15. Why did you use CloudWatch when you already had Grafana?

**Answer:**

Grafana is useful for visualizing metrics collected by Prometheus, while CloudWatch is AWS's native monitoring service. CloudWatch integrates directly with AWS resources, supports alarms, log management, and works seamlessly with services like SNS.

---

# IAM Role

### 16. Why did you use an IAM Role instead of Access Keys?

**Answer:**

IAM Roles provide temporary credentials automatically. This is more secure than storing long-term AWS access keys on the EC2 instance.

---

# CloudWatch Alarm

### 17. What is a CloudWatch Alarm?

**Answer:**

A CloudWatch Alarm continuously checks a selected metric. If the metric crosses the configured threshold, it changes its state and performs an action such as sending a notification.

---

# Amazon SNS

### 18. What is Amazon SNS?

**Answer:**

Amazon SNS is a notification service. In this project, it sends email notifications whenever a CloudWatch Alarm is triggered.

---

# Logging

### 19. Why are log files important?

**Answer:**

Log files provide a record of system activity, alerts, and recovery actions. They help in troubleshooting and understanding what happened on the server.

---

# Project Design

### 20. Which part of this project did you build yourself?

**Answer:**

I designed and wrote the Bash monitoring scripts, alert management, self-healing logic, deployment scripts, and project documentation. I also configured AWS services such as EC2, IAM Roles, CloudWatch, CloudWatch Alarms, and Amazon SNS, and integrated them with the monitoring platform.

---

# Improvements

### 21. If you had more time, what would you improve?

**Answer:**

I would extend the project to monitor multiple EC2 instances, create custom Grafana dashboards, containerize the platform using Docker, provision infrastructure with Terraform, and build a CI/CD pipeline using GitHub Actions.

---

# Lessons Learned

### 22. What did you learn from this project?

**Answer:**

This project helped me understand Linux administration, Bash scripting, cloud monitoring, AWS services, system automation, and how different monitoring tools work together in a real environment.

---

# Final Tip

During an interview, don't try to memorize these answers word for word.

Instead, understand the idea behind each answer and explain it in your own words. Interviewers usually ask follow-up questions, so understanding the concepts is much more valuable than memorizing prepared responses.

# AWS EC2 Setup

## Overview

This project runs on an Ubuntu EC2 instance hosted on AWS.

In this step, I created the virtual server that will host the monitoring platform. The EC2 instance will be used to install the monitoring scripts, Prometheus, Grafana, and AWS monitoring services in the next phases.

---

## EC2 Configuration

| Setting          | Value                   |
| ---------------- | ----------------------- |
| Operating System | Ubuntu Server 24.04 LTS |
| Instance Type    | t2.micro                |
| Storage          | 15 GB gp3               |
| Network          | Default VPC             |
| Public IP        | Enabled                 |

---

## Security Group

The following inbound rules were added.

| Port | Purpose       |
| ---- | ------------- |
| 22   | SSH Access    |
| 80   | HTTP          |
| 443  | HTTPS         |
| 3000 | Grafana       |
| 9090 | Prometheus    |
| 9100 | Node Exporter |

During development, SSH and monitoring ports are restricted to **My IP** for better security.

---

## What I Completed

* Launched an Ubuntu EC2 instance.
* Configured the Security Group.
* Verified that the instance was running.
* Confirmed that a public IPv4 address was assigned.
* Downloaded the SSH key pair for secure access.

---

## Result

The EC2 instance is ready for software installation and project deployment.


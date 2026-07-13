# Commands Used

This document contains some of the important commands used while building and configuring the project. They are grouped by purpose to make them easier to understand.

---

# Connect to EC2

Connect to the Ubuntu EC2 instance using SSH.

```bash
ssh -i your-key.pem ubuntu@<EC2-Public-IP>
```

---

# System Update

Update the package list and install the latest security updates.

```bash
sudo apt update
sudo apt upgrade -y
```

---

# Install Required Packages

Install the basic tools required for the project.

```bash
sudo apt install -y git wget curl unzip vim tree
```

---

# Clone the Repository

Clone the project from GitHub.

```bash
git clone <repository-url>
```

Move into the project directory.

```bash
cd Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform
```

---

# File Permissions

Make all Bash scripts executable.

```bash
chmod +x scripts/*.sh
```

---

# Create Project Directories

Create folders for logs and backups.

```bash
mkdir -p logs
mkdir -p backup/logs
```

---

# Run Monitoring Scripts

Run the monitoring platform manually.

```bash
./scripts/monitor.sh
```

Run individual monitoring scripts.

```bash
./scripts/cpu-monitor.sh
./scripts/memory-monitor.sh
./scripts/disk-monitor.sh
./scripts/service-monitor.sh
```

---

# Check Log Files

View monitoring logs.

```bash
cat logs/monitoring.log
```

View alert logs.

```bash
cat logs/alerts.log
```

View self-healing logs.

```bash
cat logs/self-healing.log
```

Watch logs in real time.

```bash
tail -f logs/monitoring.log
```

---

# Cron Jobs

Edit Cron jobs.

```bash
crontab -e
```

View configured Cron jobs.

```bash
crontab -l
```

---

# Check Service Status

Check Node Exporter.

```bash
sudo systemctl status node_exporter
```

Check Prometheus.

```bash
sudo systemctl status prometheus
```

Check Grafana.

```bash
sudo systemctl status grafana-server
```

Check CloudWatch Agent.

```bash
sudo systemctl status amazon-cloudwatch-agent
```

---

# Restart Services

Restart a service manually.

```bash
sudo systemctl restart apache2
```

```bash
sudo systemctl restart prometheus
```

```bash
sudo systemctl restart grafana-server
```

```bash
sudo systemctl restart node_exporter
```

---

# Enable Services

Start services automatically after every reboot.

```bash
sudo systemctl enable node_exporter
sudo systemctl enable prometheus
sudo systemctl enable grafana-server
sudo systemctl enable amazon-cloudwatch-agent
```

---

# Verify Node Exporter

Check if Node Exporter is exposing metrics.

```bash
curl http://localhost:9100/metrics
```

---

# Verify Prometheus

Open Prometheus in the browser.

```text
http://<EC2-Public-IP>:9090
```

---

# Verify Grafana

Open Grafana in the browser.

```text
http://<EC2-Public-IP>:3000
```

---

# Verify IAM Role

Display the IAM Role attached to the EC2 instance.

```bash
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
```

Display IAM role information.

```bash
curl http://169.254.169.254/latest/meta-data/iam/info
```

---

# Deployment Script

Run the complete deployment process.

```bash
chmod +x deployment/deploy.sh
./deployment/deploy.sh
```

---

# Git Commands

Check the repository status.

```bash
git status
```

Add project changes.

```bash
git add .
```

Commit changes.

```bash
git commit -m "Your commit message"
```

Push changes to GitHub.

```bash
git push origin main
```

---

# Useful Linux Commands

Show the current directory.

```bash
pwd
```

List files.

```bash
ls -l
```

Display the project structure.

```bash
tree -L 2
```

Check disk usage.

```bash
df -h
```

Check memory usage.

```bash
free -h
```

Check CPU information.

```bash
lscpu
```

---

# Notes

- Most commands in this document were executed on an Ubuntu EC2 instance.
- Some AWS-related tasks, such as creating IAM Roles, CloudWatch Dashboards, CloudWatch Alarms, and SNS Topics, were completed through the AWS Management Console.
- Service names and file paths may vary depending on the operating system and software versions.

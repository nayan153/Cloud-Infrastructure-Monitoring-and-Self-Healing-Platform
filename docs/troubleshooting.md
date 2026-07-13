# Troubleshooting

This document contains some of the common issues I faced while building this project and the steps I followed to resolve them.

---

# 1. Unable to Connect to EC2 Using SSH

### Problem

I was unable to connect to the EC2 instance using SSH.

### Possible Causes

- Incorrect key pair
- Wrong public IP address
- Port 22 not allowed in the Security Group

### Solution

- Verified that the correct `.pem` file was being used.
- Checked the EC2 public IPv4 address.
- Allowed SSH (Port 22) from **My IP** in the Security Group.
- Updated the key permission.

```bash
chmod 400 your-key.pem
```

---

# 2. Grafana Dashboard Not Opening

### Problem

Grafana was installed, but the web interface could not be accessed.

### Possible Causes

- Grafana service was not running.
- Port 3000 was blocked.

### Solution

Checked the Grafana service.

```bash
sudo systemctl status grafana-server
```

Started the service if required.

```bash
sudo systemctl start grafana-server
```

Allowed Port **3000** in the EC2 Security Group.

---

# 3. Prometheus Target Showing DOWN

### Problem

Node Exporter appeared as **DOWN** in Prometheus.

### Possible Causes

- Node Exporter service stopped.
- Incorrect target in `prometheus.yml`.

### Solution

Checked the Node Exporter service.

```bash
sudo systemctl status node_exporter
```

Verified the target configuration.

```yaml
targets:
  - localhost:9100
```

Restarted Prometheus.

```bash
sudo systemctl restart prometheus
```

---

# 4. Node Exporter Service Not Running

### Problem

The Node Exporter service failed to start.

### Solution

Verified the service file.

```bash
sudo systemctl status node_exporter
```

Reloaded systemd.

```bash
sudo systemctl daemon-reload
```

Restarted the service.

```bash
sudo systemctl restart node_exporter
```

---

# 5. CloudWatch Agent Not Sending Metrics

### Problem

The CloudWatch Agent was running, but no metrics appeared in Amazon CloudWatch.

### Possible Causes

- IAM Role not attached.
- Incorrect configuration file.

### Solution

Verified that the EC2 instance had an IAM Role attached.

Restarted the CloudWatch Agent.

```bash
sudo systemctl restart amazon-cloudwatch-agent
```

Checked the agent status.

```bash
sudo systemctl status amazon-cloudwatch-agent
```

---

# 6. CloudWatch Logs Not Appearing

### Problem

The expected log groups were not created in CloudWatch.

### Solution

Verified the log file paths in the CloudWatch Agent configuration.

Confirmed that the log files existed.

Restarted the CloudWatch Agent after updating the configuration.

---

# 7. CloudWatch Alarm Not Triggering

### Problem

The CloudWatch Alarm remained in the **OK** state.

### Solution

Checked the alarm threshold.

Generated CPU load to test the alarm.

```bash
yes > /dev/null
```

Waited a few minutes for CloudWatch to evaluate the metric.

Stopped the test.

```bash
Ctrl + C
```

---

# 8. SNS Email Not Received

### Problem

The CloudWatch Alarm changed to **ALARM**, but no email was received.

### Solution

Verified that the SNS email subscription had been confirmed.

Checked that the correct SNS topic was selected in the CloudWatch Alarm.

Reviewed the alarm history in CloudWatch.

---

# 9. Monitoring Script Not Running Automatically

### Problem

The monitoring script worked manually but did not run automatically.

### Solution

Verified the Cron configuration.

```bash
crontab -l
```

Checked that the script had execute permission.

```bash
chmod +x scripts/monitor.sh
```

Verified the script path used in the Cron job.

---

# 10. Log Files Not Updating

### Problem

The monitoring log was not receiving new entries.

### Solution

Ran the monitoring script manually to confirm it was working.

```bash
./scripts/monitor.sh
```

Checked file permissions.

Verified that the log directory existed.

```bash
ls logs/
```

---

# 11. Permission Denied While Running Scripts

### Problem

The Bash scripts returned a **Permission denied** error.

### Solution

Made all scripts executable.

```bash
chmod +x scripts/*.sh
```

---

# 12. Service Failed After Editing Configuration

### Problem

A service stopped working after modifying its configuration.

### Solution

Validated the configuration file.

Restarted the service.

```bash
sudo systemctl restart <service-name>
```

Checked the service status.

```bash
sudo systemctl status <service-name>
```

---

# General Troubleshooting Tips

Whenever I encountered an issue, I usually followed these steps:

- Checked whether the required service was running.
- Verified the configuration files.
- Confirmed that the required ports were open.
- Reviewed the log files for error messages.
- Restarted the affected service after making changes.
- Tested the functionality again before moving to the next step.

Following this approach helped me identify and resolve most issues during the project.

# Node Exporter

## Overview

Node Exporter is used to collect system metrics from the Ubuntu server.

It provides information such as CPU usage, memory usage, disk usage, network activity, and system uptime. These metrics are later collected by Prometheus and displayed in Grafana.

---

## Installation

Node Exporter was installed as a Linux service so that it starts automatically whenever the server boots.

The binary was placed in `/usr/local/bin`, and a systemd service was created to manage it.

---

## Verification

After starting the service, I verified that it was running correctly using:

```bash
sudo systemctl status node_exporter
```

I also checked the metrics endpoint:

```bash
curl http://localhost:9100/metrics
```

The output confirmed that Node Exporter was collecting and exposing system metrics successfully.

---

## Result

The EC2 instance is now ready to provide system metrics for Prometheus.


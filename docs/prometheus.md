# Prometheus

## Overview

Prometheus is responsible for collecting and storing metrics from Node Exporter.

Instead of checking the server directly, Prometheus regularly requests data from Node Exporter and saves it in its own time-series database. This allows the metrics to be visualized later in Grafana.

---

## Configuration

Prometheus was configured to collect metrics from the Node Exporter service running on the same EC2 instance.

The metrics endpoint is:

```text
http://localhost:9100/metrics
```

The scrape interval is set to 15 seconds.

---

## Verification

After starting the Prometheus service, I confirmed that it was running correctly using:

```bash
sudo systemctl status prometheus
```

I also opened the Prometheus web interface and verified that the Node Exporter target was in the **UP** state.

---

## Result

Prometheus is now collecting system metrics from the EC2 instance and storing them for visualization and monitoring.


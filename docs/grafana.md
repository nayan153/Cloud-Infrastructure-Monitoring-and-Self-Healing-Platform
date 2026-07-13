# Grafana

## Overview

Grafana is used to display the metrics collected by Prometheus in a simple and visual way.

Instead of reading raw metric values, Grafana helps monitor the server using dashboards and graphs.

---

## Configuration

Grafana was installed on the EC2 instance and configured to use Prometheus as its data source.

The Prometheus server is available at:

```text
http://localhost:9090
```

After connecting the data source, I imported the Node Exporter dashboard to monitor the server.

---

## Verification

I verified the installation by:

* Opening the Grafana web interface.
* Connecting Grafana to Prometheus.
* Importing the Node Exporter dashboard.
* Confirming that CPU, memory, disk, and network metrics were displayed correctly.

---

## Result

Grafana is now connected to Prometheus and provides a live dashboard for monitoring the EC2 instance.


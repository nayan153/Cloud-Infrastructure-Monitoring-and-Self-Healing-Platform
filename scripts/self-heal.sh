#!/bin/bash

./apache2.sh
./node_exporter.sh
./prometheus.sh
./grafana.sh
./prometheus.sh

echo "Done"

#!/bin/bash
set -euo pipefail
echo "==========SYSTEM UPDATE AND UPGRADE=========="

sudo apt update
sleep 2s
sudo apt upgrade -y
sleep 2s

echo "==========SYSTEM UPDATE AND UPGRADE SUCESSFULLY============="


echo "========== INSTALL MONITORING UTILITIES=========="

echo "$(sudo apt install htop sysstat net-tools -y)"
echo "==============waiting ============="
sleep 4s

echo "==========SERVER INSTALLATION=========="

read -p "Enter the name of the server: apache2 or nginx:   " server

if [[ "$server" != "apache2" && "$server" != "nginx" ]]; then
    echo "Invalid server."
    exit 1
fi

echo "============Installation of $server==========="
sudo apt install $server -y
sleep 2s

echo "================start $server================"
sudo systemctl start $server
sleep 2s

echo "================restart $server================"
sudo systemctl restart $server
sleep 2s

echo "================ $server status ================"
echo "$(systemctl is-active $server)"
echo "==============waiting ============="

sleep 5s

echo "================Install Required Packages================"
sudo apt install -y git wget curl unzip vim tree

echo "============INSTALL GIT CURL UNZIP VIM TREE ================="
echo "$(git --version)"
echo "$(curl --version)"
echo "$(tree --version)"
sleep 5s


echo "========== Node Exporter INSTALLATION=========="
user=$(whoami)

cd /home/$user
mkdir -p download

echo "========== download folder created =========="
cd download
echo "$(pwd)"
sleep 2s

echo "========= DOWNLOAD NODE EXPORTER =========="

if [ ! -f node_exporter-1.9.1.linux-amd64.tar.gz ]; then
	wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
fi
echo "========= DOWNLOADED SUCCESSFULLY  NODE EXPORTER =========="

if [ ! -d node_exporter-1.9.1.linux-amd64 ]; then
    tar -xvf node_exporter-1.9.1.linux-amd64.tar.gz
fi

cd node_exporter-1.9.1.linux-amd64
echo "==============waiting ============="

sleep 5s

echo "=========="

echo "=========CREATING USER node_exporter=========="
id node_exporter &>/dev/null || \
sudo useradd --no-create-home --shell /bin/false node_exporter
sleep 3s
echo " User created successfully $(id node_exporter)"
echo "==============waiting ============="

sleep 5s

cd /home/$user/download/node_exporter-1.9.1.linux-amd64
sudo cp node_exporter /usr/local/bin/
sudo chmod +x /usr/local/bin/node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
echo "$(ls -l /usr/local/bin/node_exporter)"
echo "==============waiting ============="

sleep 5s

sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
echo "==============waiting ============="

sleep 5s

sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
sudo systemctl restart node_exporter
echo "$(sudo systemctl is-active node_exporter)"
echo "==============waiting ============="

sleep 5s

echo "==========SYSTEM UPDATE=========="

cd ~/download
if [ ! -f prometheus-3.5.0.linux-amd64.tar.gz ]; then
        wget https://github.com/prometheus/prometheus/releases/download/v3.5.0/prometheus-3.5.0.linux-amd64.tar.gz
fi


echo "$(ls)"
echo "==============waiting ============="

sleep 5s
if [ ! -d "prometheus-3.5.0.linux-amd64" ]; then
    tar -xvf prometheus-3.5.0.linux-amd64.tar.gz
fi

cd prometheus-3.5.0.linux-amd64
echo "$(ls)"
echo "==============waiting ============="

sleep 5s
id prometheus &>/dev/null || \
sudo useradd --no-create-home --shell /bin/false prometheus
echo "$(id prometheus)"
echo "==============waiting ============="

sleep 5s

sudo mkdir -p /etc/prometheus
sudo mkdir -p /var/lib/prometheus
sudo cp prometheus /usr/local/bin/
sudo chmod +x /usr/local/bin/prometheus
sudo cp promtool /usr/local/bin/
sudo chmod +x /usr/local/bin/promtool
sudo cp prometheus.yml /etc/prometheus/
echo "$(ls /usr/local/bin/prometheus)"
echo "==============waiting ============="

sleep 5s

echo "$(ls /etc/prometheus)"
echo "==============waiting ============="

sleep 5s

sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus


sudo tee /etc/prometheus/prometheus.yml > /dev/null <<EOF
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "node_exporter"
    static_configs:
      - targets: ["localhost:9100"]
EOF
sleep 2s
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
sleep 2s

sudo tee /etc/systemd/system/prometheus.service > /dev/null  << EOF
[Unit]
Description=Prometheus Monitoring Server
After=network.target

[Service]
User=prometheus
Group=prometheus
Type=simple

ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus

Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sleep 2s

sudo systemctl enable prometheus
sleep 2s

sudo systemctl start prometheus
sleep 2s

echo "$(sudo systemctl is-active prometheus)"
echo "==============waiting ============="

sleep 5s

sudo apt update
echo "$(sudo apt install -y apt-transport-https software-properties-common wget)"
sleep 2s

wget -q -O - https://apt.grafana.com/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/grafana.gpg
echo "$(ls /usr/share/keyrings/grafana.gpg)"
echo "==============waiting ============="

sleep 5s

echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

sudo apt update
sudo apt install grafana -y
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
echo "$(sudo systemctl is-active grafana-server)"
echo "==============waiting ============="

sleep 5s

echo "$(sudo journalctl -u grafana-server -n 30 --no-pager)"
sleep 3s
sudo ss -tlnp
echo "==============waiting ============="

sleep 5s

echo "====================================="
echo "Installation Completed Successfully"
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)
echo "Grafana    : http://$PUBLIC_IP:3000"
echo "Prometheus : http://$PUBLIC_IP:9090"
echo "Node Exporter : http://$PUBLIC_IP:9100"
echo "====================================="
sleep 5s

echo "prometheus-home_page"
echo "http://$PUBLIC_IP:9090"
sleep 5s
echo "GO TO LINK THEN -> Status -> Targets"
sleep 5s
echo "GRAFANA LINK"
echo "http://$PUBLIC_IP:3000"
echo "login using Username: admin,  Password: admin"
sleep 5s
echo "go to         Connections   ->  Data Sources -> Prometheus"
sleep 5s
echo "use http://localhost:9090    then click save and next"
echo "Import dashboard           Dashboards  -> Import      Dashboard ID 1860"


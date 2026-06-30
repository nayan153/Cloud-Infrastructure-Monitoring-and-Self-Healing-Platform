#!/bin/bash/


echo "============Install CloudWatch Agent================="

sudo apt update

wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

sudo dpkg -i amazon-cloudwatch-agent.deb
echo "$(amazon-cloudwatch-agent-ctl -h)"


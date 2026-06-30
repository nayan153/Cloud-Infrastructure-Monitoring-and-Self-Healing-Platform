# IAM Role

## Overview

To allow the EC2 instance to communicate with AWS services securely, I created an IAM Role and attached it to the instance.

Using an IAM Role removes the need to store AWS access keys on the server. AWS automatically provides temporary credentials to the EC2 instance whenever it needs to access supported services.

---

## IAM Policy

The EC2 instance was assigned the following AWS managed policy:

* CloudWatchAgentServerPolicy

This policy allows the CloudWatch Agent to send system metrics and log data to Amazon CloudWatch.

---

## Role Attachment

After creating the role, it was attached directly to the EC2 instance.

This allows applications running on the server to access AWS services without configuring access keys manually.

---

## Verification

To verify the configuration, I checked the EC2 instance metadata.

```bash
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

curl -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/iam/security-credentials/
```

The command returned the attached IAM role, confirming that the instance was able to retrieve temporary AWS credentials.

---

## Result

The EC2 instance can now securely interact with AWS services using IAM Roles. This follows AWS security best practices and avoids storing long-term credentials on the server.


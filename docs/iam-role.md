# IAM Role

## Overview

To allow the EC2 instance to communicate with AWS services securely, I created an IAM Role and attached it to the instance.

Using an IAM Role removes the need to store AWS access keys on the server. AWS automatically provides temporary credentials whenever the instance needs to access AWS services.

---

## Permission

The following managed policy was attached to the IAM Role:

* CloudWatchAgentServerPolicy

This policy allows the CloudWatch Agent to send metrics and log data to Amazon CloudWatch.

---

## Configuration

After creating the IAM Role, I attached it to the EC2 instance using the AWS Management Console.

I verified the configuration by checking the EC2 metadata service, which confirmed that the IAM Role was available on the instance.

---

## Verification

To verify the configuration, I ran:

```bash
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
```

The command returned the IAM Role name, confirming that the role was attached successfully.

---

## Result

The EC2 instance can now securely access AWS services without storing long-term access keys. This follows AWS security best practices and makes the project easier to manage.


# Security Policy

Thank you for helping improve the security of this project.

Although this project was created for learning and demonstration purposes, security is still important. If you discover a security issue or have suggestions to improve the project, please report it responsibly.

---

## Supported Versions

The latest version of this project is actively maintained.

| Version | Supported |
|---------|-----------|
| v1.0.0 | ✅ Yes |
| Older Versions | ❌ No |

---

## Reporting a Security Issue

If you discover a security vulnerability, please do not create a public GitHub Issue.

Instead, report it privately by providing the following information:

- A short description of the issue.
- Steps to reproduce the problem.
- The affected files or components.
- The possible impact.
- Suggestions for fixing the issue (if available).

I will review the report and work on a fix as soon as possible.

---

## Security Best Practices

While building this project, I followed these basic security practices:

- IAM Roles are used instead of storing AWS Access Keys on the EC2 instance.
- SSH access is restricted to trusted IP addresses whenever possible.
- Security Groups only allow the required ports.
- AWS credentials are not stored inside the repository.
- Sensitive files such as `.env` files and private keys are excluded using `.gitignore`.
- Monitoring logs are backed up regularly.
- Services are monitored continuously to detect failures.

---

## Scope

This security policy applies to the following parts of the project:

- AWS EC2
- IAM Role
- Amazon CloudWatch
- CloudWatch Agent
- CloudWatch Alarms
- Amazon SNS
- Bash Monitoring Scripts
- Prometheus
- Grafana

---

## Security Recommendations

If you use this project in your own AWS account, consider the following recommendations:

- Do not upload private SSH keys to GitHub.
- Do not store AWS Access Keys in project files.
- Use the principle of least privilege when creating IAM policies.
- Regularly update the Ubuntu server and installed packages.
- Restrict unnecessary inbound ports in the Security Group.
- Rotate credentials if they are ever exposed.

---

## Disclaimer

This project was developed for learning cloud infrastructure monitoring on AWS.

It should not be used as-is in a production environment without additional security reviews, testing, and hardening.

---

Thank you for helping make this project more secure.

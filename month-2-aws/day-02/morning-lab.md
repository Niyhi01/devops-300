# Month 2, Day 2: EC2 & AMI Morning Lab (Day 18)

## Morning Learning (6:00-6:45 AM)

### Resources Studied
- AWS EC2 Tutorial – freeCodeCamp (Watched at 1.5x speed)
- AWS EC2 Instance Types Documentation
- Link: https://amazon.com

### Key Takeaways
1. **t2.micro is the Free Tier King** - Perfect for testing without incurring costs.
2. **Security Groups are Stateful** - If you allow traffic in (Inbound), it is automatically allowed out.
3. **User Data for Bootstrapping** - Automated scripts that run on the very first boot to install software (like Nginx).
4. **AMIs are Blueprints** - A snapshot of a configured server that allows you to launch exact replicas instantly.
5. **Key Pairs are Essential** - SSH access relies on private keys (.pem); without them, you are locked out of Linux instances.

---

## Tasks Completed (6:45-7:30 AM)

### 1. EC2 Instance Launched
- **AMI:** Ubuntu 24.04 LTS
- **Instance Type:** t2.micro
- **Region:** us-east-1 (N. Virginia)
- **Public IP:** 18.232.74.213
- **Screenshot:** EC2 dashboard showing "Running" status ✅

### 2. Security Group Configured
- Allowed **SSH (Port 22)** for terminal access.
- Allowed **HTTP (Port 80)** for Nginx web traffic.
- Allowed **HTTPS (443)** for secure traffic.

### 3. SSH Connection Successful
- Fixed key permissions: `chmod 400 "ec2 practice.pem"`
- Command used: `ssh -i "ec2 practice.pem" ubuntu@18.232.74.213`
- **Screenshot:** Terminal showing successful login message ✅

### 4. Automated Nginx Installation (User Data)
- Used a Bash script to update and install Nginx on launch.
- Verified via browser: `http://18.232.74.213`
- **Screenshot:** Terminal showing `nginx -v` output ✅

### 5. Custom AMI Created
- Name: `niyhi-nginx-ami-day18`
- Created from the running instance to preserve Nginx configuration.
- **Screenshot:** AMIs page showing status "Available" ✅

---

## CLI & Verification Results
```bash
# Verify Nginx Installation
ubuntu@ip-172-31-0-229:~$ nginx -v
nginx version: nginx/1.24.0 (Ubuntu)

# Verify Instance Identity
ubuntu@ip-172-31-0-229:~$ curl http://169.254.169
i-0abc123def456789 (Example ID)

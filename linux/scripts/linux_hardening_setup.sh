#!/bin/bash

# Linux Hardening and Monitoring Setup Script (Ubuntu 20.04+)
# Run this as root or with sudo privileges

# 1. Create new sudo user
read -p "Enter new admin username: " NEW_USER
adduser $NEW_USER
usermod -aG sudo $NEW_USER

# 2. Configure SSH
echo "Configuring SSH..."
sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd

# 3. Install UFW and configure rules
echo "Setting up UFW..."
apt update && apt install ufw -y
ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw --force enable

# 4. Install unattended-upgrades
echo "Installing unattended-upgrades..."
apt install unattended-upgrades -y
dpkg-reconfigure --priority=low unattended-upgrades

# 5. Install and configure Fail2Ban
echo "Installing Fail2Ban..."
apt install fail2ban -y
systemctl enable fail2ban

# 6. Install auditd
echo "Installing auditd..."
apt install auditd audispd-plugins -y
systemctl enable auditd
systemctl start auditd

# 7. Install Logwatch
echo "Installing Logwatch..."
apt install logwatch -y

echo "Setup complete. Please verify SSH access, firewall, and monitoring manually."

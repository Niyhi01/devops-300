#define the bin/bash
#echo the intro
#update the system


#!/bin/bash
echo "Starting security hardening"
sudo apt update && sudo apt upgrade -y
echo "System Updated!"

echo "Installing Fail2Ban..."
sudo apt install fail2ban -y

echo "Enabling Firewall"
sudo ufw allow ssh
sudo ufw enable
echo "Firewall Enabled!"

echo "Enabling Fail2Ban"
sudo systemctl enable fail2ban
echo "Fsil2Ban Enabled"

echo "Hardening SSH..."
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "Enabling Unattended Upgrades..."
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure -plow unattended-upgrades

echo "Setting Security Banner..."
echo "AUTHORIZED ACCESS ONLY. ALL ACTIVITIES ARE LOGGED." | sudo tee /etc/motd

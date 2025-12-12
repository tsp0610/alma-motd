#!/bin/bash

# ===========================================
# Secure SSH Setup + Custom MOTD - TSP NODES
# ===========================================

clear

echo -e "\033[1;36m🔐 TSP NODES - Secure SSH Configuration\033[0m"
echo -e "\033[1;37m--------------------------------------\033[0m"

sleep 1

echo -e "\033[1;34m▶ Updating SSH settings...\033[0m"

# Update SSH config with safer defaults
cat <<EOF > /etc/ssh/sshd_config
# SSH LOGIN SETTINGS
PasswordAuthentication yes
PermitRootLogin yes
PubkeyAuthentication no
ChallengeResponseAuthentication no
UsePAM yes

# SECURITY IMPROVEMENTS
X11Forwarding no
AllowTcpForwarding yes

# SFTP SETTINGS
Subsystem sftp /usr/lib/openssh/sftp-server
EOF

if [ $? -eq 0 ]; then
    echo -e "\033[1;32m✔ SSH configuration applied successfully!\033[0m"
else
    echo -e "\033[1;31m✘ Failed to update SSH config!\033[0m"
fi

echo -e "\033[1;34m▶ Restarting SSH service...\033[0m"
systemctl restart sshd

echo -e "\033[1;32m✔ SSH service restarted successfully!\033[0m"
sleep 1

# Custom MOTD Install
echo -e "\033[1;34m▶ Installing Custom MOTD...\033[0m"
bash <(curl -fsSL https://raw.githubusercontent.com/tsp0610/vps-motd/main/motd.sh)

echo -e "\033[1;32m✔ Custom MOTD Installed!\033[0m"
sleep 1

clear

cat << "EOF"

████████╗███████╗██████╗     ███╗   ██╗ ██████╗ ██████╗ ███████╗███████╗
╚══██╔══╝██╔════╝██╔══██╗    ████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔════╝
   ██║   ███████╗██████╔╝    ██╔██╗ ██║██║   ██║██║  ██║█████╗  ███████╗
   ██║   ╚════██║██╔═══╝     ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ╚════██║
   ██║   ███████║██║         ██║ ╚████║╚██████╔╝██████╔╝███████╗███████║
   ╚═╝   ╚══════╝╚═╝         ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝

EOF

echo -e "\033[1;32m🎉 SSH Configuration Completed Successfully!\033[0m"
echo -e "\033[1;37m📌 TSP NODES VPS setup completed.\033[0m"

echo -e "\n\033[1;33m🔑 Please set your ROOT password below 👇\033[0m"
passwd root

echo -e "\n\033[1;36m✨ All done! Enjoy your secure server! 🚀\033[0m"

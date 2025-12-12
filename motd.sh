#!/bin/bash
# TSP NODES Advanced MOTD Installer (AlmaLinux Compatible)

echo "🔧 Installing Custom MOTD..."

# Create script in /etc/profile.d (executed on login)
cat << 'EOF' > /etc/profile.d/tspnodes.sh
#!/bin/bash

# Colors
CYAN="\e[38;5;45m"
GREEN="\e[38;5;82m"
YELLOW="\e[38;5;220m"
BLUE="\e[38;5;51m"
RESET="\e[0m"

# Stats
LOAD=$(uptime | awk -F 'load average:' '{ print $2 }' | awk '{ print $1 }')
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_PERC=$((MEM_USED * 100 / MEM_TOTAL))
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_PERC=$(df -h / | awk 'NR==2 {print $5}')
PROC=$(ps aux | wc -l)
USERS=$(who | wc -l)
IP=$(hostname -I | awk '{print $1}')
UPTIME=$(uptime -p | sed 's/up //')

clear
echo -e "${CYAN}┌──────────────────────────────────────────────────────────────┐"
echo -e "│ ████████╗███████╗██████╗     ███╗   ██╗ ██████╗ ██████╗ ███████╗ │"
echo -e "│ ╚══██╔══╝██╔════╝██╔══██╗    ████╗  ██║██╔═══██╗██╔══██╗██╔════╝ │"
echo -e "│    ██║   ███████╗██████╔╝    ██╔██╗ ██║██║   ██║██║  ██║█████╗   │"
echo -e "│    ██║   ╚════██║██╔═══╝     ██║╚██╗██║██║   ██║██║  ██║██╔══╝   │"
echo -e "│    ██║   ███████║██║         ██║ ╚████║╚██████╔╝██████╔╝███████╗│"
echo -e "│    ╚═╝   ╚══════╝╚═╝         ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝│"
echo -e "└──────────────────────────────────────────────────────────────┘${RESET}"

echo -e "${GREEN} Welcome to TSP NODES Datacenter! 🚀 ${RESET}\n"

echo -e "${BLUE}📊 System Information:${RESET} (as of $(date))\n"
printf "  ${YELLOW}CPU Load     :${RESET} %s\n" "$LOAD"
printf "  ${YELLOW}Memory Usage :${RESET} %sMB / %sMB (%s%%)\n" "$MEM_USED" "$MEM_TOTAL" "$MEM_PERC"
printf "  ${YELLOW}Disk Usage   :${RESET} %s / %s (%s)\n" "$DISK_USED" "$DISK_TOTAL" "$DISK_PERC"
printf "  ${YELLOW}Processes    :${RESET} %s\n" "$PROC"
printf "  ${YELLOW}Users Logged :${RESET} %s\n" "$USERS"
printf "  ${YELLOW}IP Address   :${RESET} %s\n" "$IP"
printf "  ${YELLOW}Uptime       :${RESET} %s\n\n" "$UPTIME"

echo -e "${CYAN}Need help? Support: support@tsplegend.xyz${RESET}"
echo -e "Website: ${BLUE}tsplegend.xyz${RESET}"
echo -e "${GREEN}Power. Performance. Reliability.${RESET}"
EOF

chmod +x /etc/profile.d/tspnodes.sh
echo "🎉 TSP NODES MOTD Installed Successfully!"
echo "➡ Reconnect SSH to see your updated MOTD."

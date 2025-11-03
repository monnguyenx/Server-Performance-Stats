#!/bin/bash
# =============================================
# SERVER STATS SCRIPT
# Author: Mon Nguyen (DevOps Practice)
# Description: Display system performance metrics
# =============================================

echo "==================== SERVER PERFORMANCE STATS ===================="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"
echo "Logged-in users: $(who | wc -l)"
echo "------------------------------------------------------------------"

# ----- CPU Usage -----
echo ">>> CPU Usage:"
mpstat 1 1 | awk '/Average/ {printf "User: %.1f%% | System: %.1f%% | Idle: %.1f%%\n", $3, $5, $12}'
echo "------------------------------------------------------------------"

# ----- Memory Usage -----
echo ">>> Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo "------------------------------------------------------------------"

# ----- Disk Usage -----
echo ">>> Disk Usage (All Mount Points):"
df -h --total | grep 'total' | awk '{printf "Used: %s / Total: %s (%s Used)\n", $3, $2, $5}'
echo "------------------------------------------------------------------"

# ----- Top 5 Processes by CPU -----
echo ">>> Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo "------------------------------------------------------------------"

# ----- Top 5 Processes by Memory -----
echo ">>> Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo "------------------------------------------------------------------"

# ----- Stretch Goals -----
echo ">>> Additional Info:"
# Failed login attempts (if /var/log/secure or auth.log exists)
if [ -f /var/log/auth.log ]; then
  echo "Failed login attempts: $(grep 'Failed password' /var/log/auth.log | wc -l)"
elif [ -f /var/log/secure ]; then
  echo "Failed login attempts: $(grep 'Failed password' /var/log/secure | wc -l)"
else
  echo "Failed login attempts: Log file not found."
fi

echo "------------------------------------------------------------------"
echo "Script completed successfully."
echo "==================================================================="

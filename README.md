https://github.com/monnguyenx/Server-Performance-Stats


---

# Server Stats Script
---

## 📘 Overview
`server-stats.sh` is a Bash script that analyzes and displays basic server performance statistics.  
It can be executed on any Linux machine and provides quick insights into CPU, memory, disk, and process usage.

---

## ⚙️ Features
- Total **CPU usage** (User, System, Idle)
- Total **Memory usage** (Used vs Total with percentage)
- Total **Disk usage** (Used vs Total with percentage)
- **Top 5 processes** by CPU usage
- **Top 5 processes** by Memory usage
- *(Optional)* Additional info:
  - OS version
  - Uptime and load average
  - Logged-in users
  - Failed login attempts

---

## 🚀 Usage

### 1. Clone or copy the script
Save the script as `server-stats.sh` in your preferred directory (e.g., `~/scripts/`).

### 2. Give execute permission
```bash
chmod +x server-stats.sh
```

### 3. Run script
```bash
./server-stats.sh
```

---

## 🕒 Schedule Automatic Execution (Optional)
Run every 30 minutes

### 1. Run using cron
```bash
crontab -e
```
### 2. Then add
```bash
*/30 * * * * /home/ubuntu/project/scripts/server-stats.sh >> /var/log/server_stats.log 2>&1
```

---
https://github.com/monnguyenx/Server-Performance-Stats

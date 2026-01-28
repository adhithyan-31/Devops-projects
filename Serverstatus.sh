#!/bin/bash

echo "========== SERVER PERFORMANCE STATS =========="
echo ""

# -------------------------------
# 1. TOTAL CPU USAGE
# -------------------------------
CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%.2f%%", 100 - $8}')
echo "🖥️  CPU Usage: $CPU_USAGE"
echo ""

# -------------------------------
# 2. MEMORY USAGE
# -------------------------------
read TOTAL USED FREE <<< $(free -m | awk '/Mem:/ {print $2, $3, $4}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f%%\", ($USED/$TOTAL)*100}")

echo "🧠 Memory Usage:"
echo "Used: ${USED}MB | Free: ${FREE}MB | Total: ${TOTAL}MB"
echo "Usage Percentage: $MEM_PERCENT"
echo ""

# -------------------------------
# 3. DISK USAGE
# -------------------------------
read DTOTAL DUSED DFREE DPERCENT <<< $(df -h / | awk 'NR==2 {print $2, $3, $4, $5}')

echo "💾 Disk Usage:"
echo "Used: $DUSED | Free: $DFREE | Total: $DTOTAL | Usage: $DPERCENT"
echo ""

# -------------------------------
# 4. TOP 5 CPU CONSUMING PROCESSES
# -------------------------------
echo "🔥 Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""

# -------------------------------
# 5. TOP 5 MEMORY CONSUMING PROCESSES
# -------------------------------
echo "🐏 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo ""

echo "=============================================="

#!/bin/bash

#  Script by Nada Hussein —  Linux system health monitor script

DATE=$(date +%Y-%m-%d_%H-%M-%S)
REPORT="system_report_$DATE.txt"

echo " System Health Report - Generated on $DATE" > "$REPORT"
echo "--------------------------------------------" >> "$REPORT"

echo -e " CPU Load:" >> "$REPORT"
top -bn1 | grep "load average" >> "$REPORT"


echo -e " Memory Usage:" >> "$REPORT"
free -h >> "$REPORT"


echo -e " Disk Usage:" >> "$REPORT"
df -h >> "$REPORT"

echo -e " Network Info (IP addresses):" >> "$REPORT"
ip a | grep inet | grep -v "127.0.0.1" >> "$REPORT"


echo -e "internet conictivity (ping test) " >> "$REPORT"
if ping -c3 8.8.8.8 >> "$REPORT" ; then
	echo " internet  is reachable "  >> "$REPORT"
else
	echo "internet is not reachable " >> "$REPORT"
fi
 

echo -e " Number of Running Processes:" >> "$REPORT"
ps aux --no-heading | wc -l >> "$REPORT"

echo -e " Uptime:" >> "$REPORT"
uptime >> "$REPORT"


echo -e " Report saved successfully as: $REPORT"
echo "Done! Script created by Eng:Nada Hussein "

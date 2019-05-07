#!/bin/bash
export REMOTEUSER=root
nic="__nic__"
mtu="__mtu__"
MAX_LOOP=4
while true
do
MCPD_RUNNING=`ps aux | grep "/usr/bin/mcpd" | grep -v grep | wc -l`
if [ "$MCPD_RUNNING" -eq 1 ]; then
ip link set $nic mtu $mtu
exit
fi
sleep 30
if [ "$MAX_LOOP" -eq 1 ]; then
echo "MCPD not started within 2 minutes. Exiting script."
exit
fi
((MAX_LOOP--))
done

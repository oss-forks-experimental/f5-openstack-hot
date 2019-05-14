#!/bin/bash
nohup sh -c 'while true; do if [ -s /service/restjavad/supervise/pid ] ; then setsid strace -p $(cat /service/restjavad/supervise/pid) -o /shared/tmp/restjavad-strace.txt -f -s 1024 -v -tt ; break; fi ; done > /dev/null 2>&1' &>/dev/null < /dev/null &
while true; do echo 'checking if mgmt setup ready'
    if [ -f /config/setup-staticMgmt.sh ]; then
        if [ -f /config/cloud/openstack/staticMgmtReady ]; then
            break
        else
            sleep 10
        fi
    else
        break
    fi
done

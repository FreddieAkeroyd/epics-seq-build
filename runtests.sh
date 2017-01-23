#!/bin/sh
set -o errexit
MYIP=`ipconfig|grep IPv4|awk -F: '{print $2}' | sed -s 's/ //g'`
# loopback seems to give CAS ioctl errors?
export EPICS_CA_ADDR_LIST=$MYIP
export EPICS_CA_AUTO_ADDR_LIST=NO
#export EPICS_CA_BEACON_ADDR_LIST=127.255.255.255
export EPICS_CA_AUTO_BEACON_ADDR_LIST=NO
echo EPICS_CA_ADDR_LIST=$EPICS_CA_ADDR_LIST
cd $1
cd seq
make runtests
cd ..

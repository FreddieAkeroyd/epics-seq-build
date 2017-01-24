#!/bin/sh
set -o errexit
# get one IP address
MYIP=`ipconfig|grep IPv4|awk -F: '{print $2}'|head -1| sed -s 's/ //g'`
# loopback seems to give CAS ioctl errors?
#MYIP=127.0.0.1
#
export EPICS_CA_ADDR_LIST=$MYIP
export EPICS_CA_AUTO_ADDR_LIST=NO
#export EPICS_CA_BEACON_ADDR_LIST=127.255.255.255
#export EPICS_CA_BEACON_ADDR_LIST=${EPICS_CA_ADDR_LIST}
export EPICS_CA_AUTO_BEACON_ADDR_LIST=NO
echo EPICS_CA_ADDR_LIST=${EPICS_CA_ADDR_LIST}
cd $1
nohup ./epics-base/bin/${EPICS_HOST_ARCH}/caRepeater.exe < /dev/null > /dev/null 2>&1 &
cd seq
nohup make runtests < /dev/null
cd ..

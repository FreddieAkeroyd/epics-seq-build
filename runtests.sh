#!/bin/sh
set -o errexit
# seem to give CAS ioctl errors?
#export EPICS_CA_ADDR_LIST=127.0.0.1
#export EPICS_CA_AUTO_ADDR_LIST=NO
cd $1
cd seq
make -s runtests
cd ..

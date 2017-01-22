#!/bin/bash
set -o errexit
cd $1
cd epics-base
make
cd ../seq
make
cd ..

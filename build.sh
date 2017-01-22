#!/bin/bash
set -o errexit
cd epics-base
make
cd ../seq
make
cd ..

@echo off
setlocal
set "PATH=C:\Program Files\Git\bin;%~dp0utils\darcs;%PATH%"
git config --global core.autocrlf true
git clone --quiet --branch=R3.14.12.6 --single-branch https://github.com/epics-base/epics-base
rem curl -fsS -o epics_base.tar.gz https://www.aps.anl.gov/epics/download/base/baseR3.14.12.6.tar.gz
darcs get --quiet --lazy --tag=R2-1-20 http://www-csr.bessy.de/control/SoftDist/sequencer/repo/branch-2-1 seq

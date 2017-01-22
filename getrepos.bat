@echo off
setlocal
set "PATH=C:\Program Files\Git\bin;%~dp0utils\darcs;%PATH%"
git config --global core.autocrlf true
git clone https://github.com/epics-base/epics-base
cd epics-base
git checkout R3.14.12.6
cd ..
rem curl -fsS -o epics_base.tar.gz https://www.aps.anl.gov/epics/download/base/baseR3.14.12.6.tar.gz
darcs get --lazy http://www-csr.bessy.de/control/SoftDist/sequencer/repo/branch-2-2 seq

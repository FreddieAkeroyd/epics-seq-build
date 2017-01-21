@echo off
setlocal
set "PATH=C:\Program Files\Git\bin;%~dp0utils\darcs;%PATH%"
git config --global core.autocrlf true
git clone https://github.com/epics-base/epics-base
cd epics-base
git checkout R3.14.12.6
cd ..
darcs get http://www-csr.bessy.de/control/SoftDist/sequencer/repo/branch-2-1 seq

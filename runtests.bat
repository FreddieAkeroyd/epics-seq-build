@echo off
setlocal
call setpaths.bat
set EPICS_CA_ADDR_LIST=127.0.0.1
set EPICS_CA_AUTO_ADDR_LIST=NO

cd seq
make runtests
if %errorlevel% neq 0 exit /b %errorlevel% 
cd ..

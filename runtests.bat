@echo off
setlocal
call epics-base\startup\win32.bat
set "PATH=%~dp0utils\make_v4;c:\strawberry\perl\bin;%PATH%"
cd seq
set EPICS_CA_ADDR_LIST=127.0.0.1
set EPICS_CA_AUTO_ADDR_LIST=NO
make -s runtests
if %errorlevel% neq 0 exit /b %errorlevel% 
cd ..

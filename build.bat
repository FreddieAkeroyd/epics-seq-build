@echo off
setlocal
call epics-base\startup\win32.bat
set "PATH=%~dp0utils\make_v3;%~dp0utils\re2c;c:\strawberry\perl\bin;%PATH%"
set "MYBASE=%~dp0epics-base"
echo EPICS_BASE=%MYBASE:\=/%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
echo EPICS_BASE=%MYBASE:\=/%>>seq\configure\RELEASE
cd epics-base
make
if %errorlevel% neq 0 exit /b %errorlevel% 
cd ..\seq
make
if %errorlevel% neq 0 exit /b %errorlevel% 
cd ..

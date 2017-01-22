@echo off
setlocal
call epics-base\startup\win32.bat
set "PATH=%~dp0utils\make_v4;%~dp0utils\re2c;c:\strawberry\perl\bin;%PATH%"
set "MYBASE=%~dp0epics-base"
REM maybe needed because MinGW is installed too?
set "SHELL=%COMSPEC%"
set "MAKESHELL=%COMSPEC%"

echo EPICS_BASE=%MYBASE:\=/%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
echo EPICS_BASE=%MYBASE:\=/%>>seq\configure\RELEASE

cd epics-base
make4
if %errorlevel% neq 0 exit /b %errorlevel% 
cd ..\seq
make4
if %errorlevel% neq 0 exit /b %errorlevel% 
cd ..

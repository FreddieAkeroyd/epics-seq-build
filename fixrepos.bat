@echo off
setlocal
copy /y files\epics-startup-win32.bat epics-base\startup\win32.bat

set "MYBASE=%~dp0epics-base"
echo EPICS_BASE=%MYBASE:\=/%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
echo EPICS_BASE=%MYBASE:\=/%>>seq\configure\RELEASE

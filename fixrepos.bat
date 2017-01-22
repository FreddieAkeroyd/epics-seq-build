@echo off
setlocal
copy /y files\epics-startup-win32.bat epics-base\startup\win32.bat

set "MYBASE=%~dp0epics-base"
set CYGPATH_EXE=c:\cygwin64\bin\cygpath.exe
if "%EPICS_HOST_ARCH:~0,6%" == "cygwin" (
    for /F "usebackq" %%I in (`%CYGPATH_EXE% %MYBASE%`) do SET MYBASECYG=%%I
    echo EPICS_BASE=%MYBASECYG%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
    echo EPICS_BASE=%MYBASECYG%>>seq\configure\RELEASE
) else (
    echo EPICS_BASE=%MYBASE:\=/%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
    echo EPICS_BASE=%MYBASE:\=/%>>seq\configure\RELEASE
)

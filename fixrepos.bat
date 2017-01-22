@echo off
setlocal
copy /y files\epics-startup-win32.bat epics-base\startup\win32.bat

set "MYBASE=%~dp0epics-base"
set CYGPATH_EXE=c:\cygwin64\bin\cygpath.exe
if "%EPICS_HOST_ARCH:~0,6%" == "cygwin" (
    for /F "usebackq" %%I in (`%CYGPATH_EXE% %MYBASE%`) do SET MYBASECYG=%%I
    echo EPICS_BASE=%MYBASECYG%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
    echo EPICS_BASE=%MYBASECYG%>>seq\configure\RELEASE
	rem if you need to add packages, i think this is the way
    rem c:\cygwin64\setup-x86_64.exe -qnNdO -R C:/cygwin64 -s http://cygwin.mirror.constant.com -l C:/cygwin64/var/cache/setup -P somepackagename
) else (
    echo EPICS_BASE=%MYBASE:\=/%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
    echo EPICS_BASE=%MYBASE:\=/%>>seq\configure\RELEASE
)



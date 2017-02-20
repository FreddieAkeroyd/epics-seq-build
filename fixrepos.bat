@echo off
setlocal
set "PATH=%~dp0utils\sed;%PATH%"

copy /y files\epics-startup-win32.bat epics-base\startup\win32.bat

REM replace /nologo with -nologo etc. to help seq build with VS 2015 express
@echo Patching CPP in CONFIG.win32-x86.win32-x86
sed -i -e "s/^CPP =.*/CPP = cl -nologo -C -E/" epics-base\configure\os\CONFIG.win32-x86.win32-x86

set "MYBASE=%~dp0epics-base"

if "%EPICS_HOST_ARCH:~0,13%" == "cygwin-x86_64" (
    set CYGPATH_EXE=c:\cygwin64\bin\cygpath.exe
    set CYGSETUP=c:\cygwin64\setup-x86_64.exe
    set CYGDIR=c:\cygwin64
) else (
    set CYGPATH_EXE=c:\cygwin\bin\cygpath.exe
    set CYGSETUP=c:\cygwin\setup-x86.exe
    set CYGDIR=c:\cygwin
)

REM need to do this is separate secion or get expansion issues
if "%EPICS_HOST_ARCH:~0,6%" == "cygwin" (
    for /F "usebackq" %%I in (`%CYGPATH_EXE% %MYBASE%`) do SET MYBASECYG=%%I
)

if "%EPICS_HOST_ARCH:~0,6%" == "cygwin" (
    echo EPICS_BASE=%MYBASECYG%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
    echo EPICS_BASE=%MYBASECYG%>>seq\configure\RELEASE
    REM the location of "setup.exe" and cache directory here is for current Appveyor images
    %CYGSETUP% -qnNdO -R %CYGDIR:\=/% -s http://cygwin.mirror.constant.com -l %CYGDIR:\=/%/var/cache/setup -P libreadline-devel -P libncursesw-devel -P libncurses-devel
) else (
    echo EPICS_BASE=%MYBASE:\=/%>configure\EPICS_BASE.%EPICS_HOST_ARCH%
    echo EPICS_BASE=%MYBASE:\=/%>>seq\configure\RELEASE
)


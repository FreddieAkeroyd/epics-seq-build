@echo off
setlocal
if "%EPICS_HOST_ARCH:~0,6%" == "cygwin" (
    call cygruntests.bat
    if %errorlevel% neq 0 exit /b %errorlevel%
    goto :EOF
)

if "%EPICS_HOST_ARCH:~0,17%" == "windows-x64-mingw" (
    call mingwsetpaths.bat
) else (
    call setpaths.bat
)

set MYIP=127.0.0.1
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:"IPv4 Address" ^| findstr 130.246.`) do (
    set MYIP=%%f
    goto :done
)
:done

rem set EPICS_CA_ADDR_LIST=%MYIP%
set EPICS_CA_ADDR_LIST=127.0.0.1
set EPICS_CA_AUTO_ADDR_LIST=NO
rem set EPICS_CA_BEACON_ADDR_LIST=%EPICS_CA_ADDR_LIST%
set EPICS_CA_AUTO_BEACON_ADDR_LIST=NO
echo EPICS_CA_ADDR_LIST=%EPICS_CA_ADDR_LIST%

cd seq
make runtests
if %errorlevel% neq 0 exit /b %errorlevel% 
cd ..


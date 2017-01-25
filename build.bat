@echo off
setlocal

if "%EPICS_HOST_ARCH:~0,6%" == "cygwin" (
    call cygbuild.bat
    if %errorlevel% neq 0 exit /b %errorlevel%
    goto :EOF
)

if "%EPICS_HOST_ARCH:~0,17%" == "windows-x64-mingw" (
    call mingwsetpaths.bat
) else (
    call setpaths.bat
)

cd epics-base
make
if %errorlevel% neq 0 exit /b %errorlevel%
cd ..

cd seq
make
if %errorlevel% neq 0 exit /b %errorlevel%
cd ..

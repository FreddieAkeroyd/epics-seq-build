@echo off
setlocal
set "PATH=%~dp0utils\re2c;%PATH%"
set CYGPATH_EXE=c:\cygwin64\bin\cygpath.exe
for /F "usebackq" %%I in (`%CYGPATH_EXE% %~dp0build.sh`) do SET BUILDCYG=%%I
for /F "usebackq" %%I in (`%CYGPATH_EXE% %~dp0`) do SET MYDIRCYG=%%I
c:\cygwin64\bin\bash.exe --login %BUILDCYG% %MYDIRCYG%

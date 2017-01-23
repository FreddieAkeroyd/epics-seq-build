@echo off
setlocal
call cygsetpaths.bat
if "%EPICS_HOST_ARCH:~0,13%" == "cygwin-x86_64" (
    set CYGPATH_EXE=c:\cygwin64\bin\cygpath.exe
	set CYGBASH_EXE=c:\cygwin64\bin\bash.exe
) else (
    set CYGPATH_EXE=c:\cygwin\bin\cygpath.exe
	set CYGBASH_EXE=c:\cygwin\bin\bash.exe
)
for /F "usebackq" %%I in (`%CYGPATH_EXE% %~dp0runtests.sh`) do SET RUNTESTSCYG=%%I
for /F "usebackq" %%I in (`%CYGPATH_EXE% %~dp0`) do SET MYDIRCYG=%%I
%CYGBASH_EXE% --login %RUNTESTSCYG% %MYDIRCYG%

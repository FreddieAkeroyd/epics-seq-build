ren @echo off
setlocal
set CYGPATH_EXE=c:\cygwin64\bin\cygpath.exe
for /F "usebackq" %%I in (`%CYGPATH_EXE% %~dp0runtests.sh`) do SET RUNTESTSCYG=%%I
for /F "usebackq" %%I in (`%CYGPATH_EXE% %~dp0`) do SET MYDIRCYG=%%I
c:\cygwin64\bin\bash.exe --login %RUNTESTSCYG% %MYDIRCYG%

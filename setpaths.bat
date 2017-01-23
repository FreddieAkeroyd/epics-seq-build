@echo off
call %~dp0epics-base\startup\win32.bat
set "PATH=%~dp0utils\make_v4;%~dp0utils\re2c;c:\strawberry\perl\bin;%PATH%"
REM maybe needed because MinGW is installed too?
REM set "SHELL=%COMSPEC%"
REM set "MAKESHELL=%COMSPEC%"

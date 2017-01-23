@echo off
setlocal

call setpaths.bat

cd epics-base
make
if %errorlevel% neq 0 exit /b %errorlevel%
cd ..

cd seq
make
if %errorlevel% neq 0 exit /b %errorlevel%
cd ..

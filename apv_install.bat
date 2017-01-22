call setversions.bat
call getrepos.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call fixrepos.bat

@ECHO OFF

if "%EPICS_HOST_ARCH%" == "" (
    set EPICS_HOST_ARCH=windows-x64
)

if exist "C:\Program files (x86)\Microsoft Visual Studio %VC_VER%\VC\vcvarsall.bat" set VCVERSION=%VC_VER%

if exist "C:\Program files (x86)\Microsoft Visual Studio %VCVERSION%\VC\vcvarsall.bat" (
  if "%EPICS_HOST_ARCH:~0,11%" == "windows-x64" (
	 @echo Using Visual Studio %VCVERSION% x64 cross compiler
     call "C:\Program files (x86)\Microsoft Visual Studio %VCVERSION%\VC\vcvarsall.bat" x86_amd64
  )
  if "%EPICS_HOST_ARCH:~0,9%" == "win32-x86" (
	 @echo Using Visual Studio %VCVERSION% x86 native compiler
     call "C:\Program files (x86)\Microsoft Visual Studio %VCVERSION%\VC\vcvarsall.bat" x86
  )
)

set MAKEFLAGS=-w

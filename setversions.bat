@echo off
REM set global versions for build

if "%EPICS_VER%" == "" set EPICS_VER=3.14.12.6

if "%SEQ_BRANCH%" == "" set SEQ_BRANCH=2-1
REM You can also add e.g.   set SEQ_VER=2-1-20    to not build most recent 

if "%VC_VER%" == "" set VC_VER=14.0

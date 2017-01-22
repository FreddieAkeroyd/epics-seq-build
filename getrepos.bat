@echo off
setlocal
set "PATH=C:\Program Files\Git\bin;%~dp0utils\darcs;%PATH%"

if exist "epics-base" (
    rd /q /s epics-base
)
@echo Getting EPICS %EPICS_VER%
git clone --quiet --branch=R%EPICS_VER% --single-branch https://github.com/epics-base/epics-base
REM curl -fsS -o epics_base.tar.gz https://www.aps.anl.gov/epics/download/base/baseR3.14.12.6.tar.gz

if exist "seq" (
    rd /q /s seq
)
if "%SEQ_VER%" == "" (
    @echo Getting latest SEQ %SEQ_BRANCH% branch
    darcs get --quiet --lazy http://www-csr.bessy.de/control/SoftDist/sequencer/repo/branch-%SEQ_BRANCH% seq
) else (
    @echo Getting SEQ version %SEQ_VER% from %SEQ_BRANCH% branch
    darcs get --quiet --lazy --tag=R%SEQ_VER% http://www-csr.bessy.de/control/SoftDist/sequencer/repo/branch-%SEQ_BRANCH% seq
)

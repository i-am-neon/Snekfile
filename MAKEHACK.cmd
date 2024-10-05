@echo off
setlocal enabledelayedexpansion

set INPUT=%~dp0Clean.gba
set OUTPUT=%~dp0NewModified.gba
set OUTPUT_UPS=%~dp0New.ups
set MASTER=%~dp0Master.event

set currDir=%~dp0

rem Copy our clean ROM to overwrite our edited ROM, so EA has a clean ROM to work with.
copy "%INPUT%" "%OUTPUT%"

rem Move our working directory to EA's folder.
cd "!currDir!Event Assembler"

rem Run Event Assembler on our copy of FE8 clean with our buildfile master.
Core A FE8 "-output:%OUTPUT%" "-input:%MASTER%"
if ERRORLEVEL 1 (
    exit /b 1
)

rem Autogenerate a ups patch of our newly assembled ROM.
cd "!currDir!ups"
ups diff -b "%INPUT%" -m "%OUTPUT%" -o "%OUTPUT_UPS%"

if ERRORLEVEL 1 (
    exit /b 1
)

if /I not [%1]==[noPause] (
    pause
)
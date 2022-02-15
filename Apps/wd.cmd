:: WinGet Download Only
@echo off
cls
COLOR 6F
SET GETTABLE=%1
TITLE WinGet Download ONLY (Non Core Command) ... %GETTABLE%
winget install --source winget --exact --id %GETTABLE%
winget show --id %GETTABLE% > %TEMP%\winget-show.log
winget show --id %GETTABLE%
code > %TEMP%\winget-show.log
if %ERRORLEVEL% EQU 0 (Echo %GETTABLE% installed successfully.) else (Echo %GETTABLE% INSTALL Did Not Go Well!)
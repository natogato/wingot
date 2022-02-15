:: winget list (enhanced)
:: Author nathan@futurework.ai
@echo off
cls
COLOR 6F
SET GETTABLE=%1
TITLE winget list ...
winget list > %TEMP%\winget-list-raw.log
code %TEMP%\winget-list-raw.log
:: Now Post Process the File in PowerShell
:: TODO: Use the SQLite Database Information from the --exact Id values and present the information
:: in an Enhanced layout and Also Generate a %TEMP%\winget-list-enhanced.tsv File
::if %ERRORLEVEL% EQU 0 (Echo %GETTABLE% installed successfully.) else (Echo %GETTABLE% INSTALL Did Not Go Well!)
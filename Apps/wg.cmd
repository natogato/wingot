:: Gettable
:: Author nathan@futurework.ai
@echo off
cls
COLOR 6F
SET GETTABLE=%1
TITLE Installing ... %GETTABLE%
winget install --source winget --exact --id %GETTABLE%
if %ERRORLEVEL% EQU 0 (Echo %GETTABLE% installed successfully.) else (Echo %GETTABLE% INSTALL Did Not Go Well!)
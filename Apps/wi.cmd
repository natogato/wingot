:: WinGet Wrapper
:: TODO: Attempt an Upgrade when it Fails you know it's not installed so Install ?
:: Experiment more with the combinations
@echo off
cls
COLOR 6F
SET GETTABLE=%1
TITLE Installing ... %GETTABLE%
winget install --source winget --exact --id %GETTABLE%
if %ERRORLEVEL% EQU 0 (Echo %GETTABLE% installed successfully.) else (Echo %GETTABLE% INSTALL Did Not Go Well!)

:: wy = WinGet YANK
@echo off
cls
COLOR 7F
SET GETTABLE=%1
TITLE WinGet UnInstally/YANK ... %GETTABLE%
:: TODO: Check for Running As Admin?
winget uninstall --id "%1"
if %ERRORLEVEL% EQU 0 (Echo %GETTABLE% UNINSTALLED successfully.) else (Echo %GETTABLE% UNINSTALLED Did Not Go Well!)
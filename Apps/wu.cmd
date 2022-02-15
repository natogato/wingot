:: WinGet Wrapper for upgrade
@echo off
cls
color 4F
TITLE WinGet UPGRADE Show Available
:: TODO: Warning this will use Lots of Bandwidth
:: NOTE: Many Packages can't be upgraded as they don't report versions correctly
:: TODO: Combine with Lastversion commands for all other things I install.
:: TODO: Add an Ignore list
winget upgrade
::if %ERRORLEVEL% EQU 0 Echo %1 Installed successfully. 

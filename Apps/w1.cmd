:: WinGet Wrapper for upgrade
@echo off
cls
color 3F
TITLE WinGet UPGRADE 1 Item
:: TODO: Warning this will use Lots of Bandwidth
:: NOTE: Many Packages can't be upgraded as they don't report versions correctly
:: TODO: Combine with Lastversion commands for all other things I install.
:: TODO: Add an Ignore list
winget upgrade --exact %1
::if %ERRORLEVEL% EQU 0 Echo %1 Installed successfully. 

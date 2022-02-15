:: WinGet Wrapper for upgrade --all
@echo off
cls
color 6F
TITLE WinGet UPGRADE ALL
:: TODO: Warning this will use Lots of Bandwidth
:: NOTE: Many Packages can't be upgraded as they don't report versions correctly
:: TODO: Combine with Lastversion commands for all other things I install.
goto check_Permissions
:check_Permissions
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    goto HasAdminRights
) else (
    echo Failure: Current permissions inadequate.
    goto byebye
)
:HasAdminRights
winget upgrade > c:\tmp\wall-raw.txt
:: winget upgrade --all
::if %ERRORLEVEL% EQU 0 Echo %1 Installed successfully. 
:: DELETE Every Time will change Every Time
IF EXIST "c:\tmp\wall-filtered.txt" DEL /F /Q "c:\tmp\wall-filtered.txt"
pwsh -NoProfile -File C:\Apps\wall-filter.ps1
IF NOT EXIST "c:\tmp\wall-filtered.txt" GOTO NothingToUpgrade
:: https://ss64.com/nt/for_f.html
FOR /F %%G IN (c:\tmp\wall-filtered.txt) DO winget upgrade --source winget --exact --id %%G
GOTO UpgradesComplete

:NothingToUpgrade
echo Nothing to Upgrade
GOTO byebye

:UpgradesComplete
winget upgrade

:byebye
echo That is all folks.
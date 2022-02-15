:: WinGet Wrapper for upgrade Multiple
@echo off
cls
color 3F
TITLE WinGet UPGRADE Many Software By ID
:: NOTE: Warning this will use Lots of Bandwidth
:: NOTE: Many Packages can't be upgraded as they don't report versions correctly
:: TODO: Combine with Lastversion commands for all other things I install.
:: TODO: Add an Ignore list
:: https://ss64.com/nt/for_f.html
FOR /F %%G IN (C:\Install\wingetted\bulk_winget_upgrade.txt) DO winget upgrade --exact %%G

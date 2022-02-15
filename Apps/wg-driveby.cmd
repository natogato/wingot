@echo off
CLS
COLOR 8F
TITLE Monitor Installer Files Downloaded by WinGet
::powershell.exe -noexit -file "C:\Apps\copy-wg-installers.ps1"
C:\Apps\FolderChangesView.exe /cfg "c:\Apps\WinGetFolderChangesView.cfg"
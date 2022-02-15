<#
   -\ 
   - 
NOTE: Depending on Output the Column Start Characters Vary
Name                           Id                                     Version     Available   Source

Name                                               Id                                Version       Available     Source
-----------------------------------------------------------------------------------------------------------------------
Docker Desktop                                     Docker.DockerDesktop              4.3.1         4.3.2         winget
Python 3                                           Python.Python.3                   3.9.7150.0    3.10.1150.0   winget
GitHub CLI                                         GitHub.cli                        2.3.0         2.4.0         winget
Microsoft Visual C++ 2015-2022 Redistributable (xΓÇª Microsoft.VC++2015-2022Redist-x86 14.30.30704.0 14.31.30919.0 winget
OSFMount                                           PassmarkSoftware.OSFMount         Unknown       3.1.1000.0    winget
5 upgrades available.
#>
# NOTE: This Script is Executed Inline from C:\Apps\wall.cmd
# TODO: Make this an External File called 'winget-skip-auto-upgrade.txt'
# One Line Per App No White Space these are incorrectly detected old versions or 
# Like Python Dual Installations are possible.
$SKIP_THESE_APPS = Get-Content -Path "C:\Apps\winget-skip-auto-upgrade.txt"
# 'Python.Python.3', 'RARLab.WinRAR', 'PassmarkSoftware.OSFMount'
#$WinGets = Select-String -Path "c:\tmp\wall-raw.txt" -Pattern 'winget'
$WinGets = Get-Content -Path "c:\tmp\wall-raw.txt"

# Get Column Marker Indexes
ForEach ($WinGet in $WinGets) {
    if ($WinGet.Contains("    Version    ")) {
        $IdIndex = $WinGet.IndexOf(" Id ") + 1
        $VersionIndex = $WinGet.IndexOf(" Version ") + 1
        $VersionOffset = $VersionIndex - $IdIndex
    }
}

ForEach ($WinGet in $WinGets) {
    if ($WinGet.Contains(" winget")) {
        # $WinGet = $WinGet.ToString()
        # Write-Output $WinGet
        # Write-Output "RAW -$WinGet-"
        # $nameBit = $WinGet.substring(0, 41)
        # # Write-Output "nameBit -$nameBit-"
        # $WinGetNoName = $WinGet.Replace($nameBit, '  ')
        $WinGetID = $WinGet.Substring($idIndex,$VersionOffset)
        $WinGetID = $WinGetID.Trim()
        # # is the exact phrase present in array?
        If ($SKIP_THESE_APPS -contains $WinGetID) {
            Write-Output "(-)  IGNORE $WinGetID"
        } else {
            Write-Output "(+) INSTALL $WinGetID"
            $WinGetID | Out-File -Encoding ASCII -FilePath "c:\tmp\wall-filtered.txt" -Append
        }
    }
}

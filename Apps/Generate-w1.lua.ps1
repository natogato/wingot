<#
Author: nathan@futurework.ai

Generates a File w1.lua intended to be saved to this path

https://en.wikipedia.org/wiki/Lua_(programming_language)

C:\Apps\cmder\vendor\clink-completions\w1.lua

this enables autocompletion for w1.cmd file

local wingetter = clink.arg.new_parser()

wingetter:set_arguments({
    "Docker.DockerDesktop",
    "Fake",
    "GitHub.GitHubDesktop", "Microsoft.Edge", "Mozilla.Thunderbird", "JanDeDobbeleer.OhMyPosh"
}
)
clink.arg.register_parser("w1", wingetter)
#>

$LUA_Completion_FilePath = "C:\Apps\cmder\vendor\clink-completions\w1.lua"

$W1LuaOpen = @"
local wingetter = clink.arg.new_parser()

wingetter:set_arguments({
"@


$W1LuaClose = @"
}
)
clink.arg.register_parser("w1", wingetter)
-- NOTE w1 is a File called C:\Apps\w1.cmd it's an Alias to winget install --exact-id %1 so we have only one argument to deal with.`
-- THis works as intended for now
-- TODO: Have this File Programatically generate the Array with all 1,000+ Packages generated directly by parsing the YAML files
-- and stripping out Package Chunks I don't care about or are 100% do not want to use.
-- TODO: Write an even better lua script that maps/parses a text file not sure which is more performant.
"@

Remove-Item -Path $LUA_Completion_FilePath -Force

$curated_ids = Get-Content -Path "C:\Install\wingot\curated-winget-exact-ids.txt"
$never_ever_ids = Get-Content -Path "C:\Install\wingot\winget-these-never-exact-ids.txt"

# https://stackoverflow.com/questions/38243736/delete-items-in-an-array-that-are-in-another-array
# NOTE: This should remove items from first Array that are in the Second Array
# The idea here is the Raw List will be updated regularly but the Never Get list is hand curated as I go.
$curated_ids = $curated_ids |Where-Object { $never_ever_ids -notcontains $_ }

# $curated_ids_array = Get-Content -Path "C:\Install\wingot\curated-winget-exact-ids.txt"
# Lose the Last Element TODO: this is likely a HACK:
# $curated_ids = $curated_ids_array[1..($curated_ids_array.Length-2)]

# $last_line = Get-Item -Path "C:\Install\wingot\curated-winget-exact-ids.txt" | Get-Content -Tail 1
# $second_last_line = Get-Item -Path "C:\Install\wingot\curated-winget-exact-ids.txt" | Get-Content -Tail 2

Write-Output "ReGenerating ... $LUA_Completion_FilePath"
Add-Content $LUA_Completion_FilePath -Value $W1LuaOpen

foreach ($curated_id in $curated_ids) {
    # $the_big_string = $the_big_string + '    "' + $curated_id +'",\n' + "\n"
    # if ($curated_id.Length -gt 2) {
    #     $the_big_string = $the_big_string + "    ""$curated_id"","
    # } else { 
    #     # Do Nothing.
    # }
    if ($curated_id -eq $curated_ids[-1]) {
        $the_big_string = $the_big_string + "    ""$curated_id"""
    } else {
        # if ($curated_id -eq $curated_ids[-2]) {
        #     $the_big_string = $the_big_string + "    ""$curated_id"","
        # } else {
            # All the Other Lines Go Here
        $the_big_string = $the_big_string + "    ""$curated_id"",`r`n"
    }
}

Add-Content $LUA_Completion_FilePath -Value $the_big_string

# $second_last_line_string = "    ""$second_last_line"","
# Add-Content "c:\tmp\w1.lua" -Value $second_last_line_string

# $last_line_string = "    ""$last_line"""
# Add-Content "c:\tmp\w1.lua" -Value $last_line_string

Add-Content $LUA_Completion_FilePath -Value $W1LuaClose

# "Docker.DockerDesktop",
# "GitHub.GitHubDesktop",
# "JanDeDobbeleer.OhMyPosh"
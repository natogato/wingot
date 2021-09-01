
# wingot

Wingot the Past Tense of winget, this Repository has a Number of Simple Scripts to make
Working with WinGet Package Manager even easier.

Primary Author of this Repo has a background in Enterprise SOE (Standard Operating Environments)
with over 22 years Hating hard on SCCM he has probably packaged Adobe Reader 100 plus times.

The Windows App Store is also a nightmare to automate.

With WinGet and a little bit of lateral thinking you can install 80% plus of all the software
you will use in day to day life as an IT professional with little trouble, and More importantly
victory is as simple as typing.

```powershell
winget upgrade --all
```

And for that victory to be complete, we want to get the right few dozen software packages installed.

---

## winget itself

Application Store (YUCK)

Via lastversion

```powershell
$WINGET_LIBRARY_FOLDER = 'C:\tmp\manifests\'

$WINGET_MANIFESTS = Get-ChildItem -Path $WINGET_LIBRARY_FOLDER -Include "*.yaml" -Recurse -File -Name
foreach ($WINGET_MANIFEST in $WINGET_MANIFESTS) {
    $fileNameOnly = Split-Path -Path $WINGET_LIBRARY_FOLDER$WINGET_MANIFEST -Leaf
    if ($fileNameOnly.Contains("installer.yaml")) {
        # -or $fileNameOnly.Contains("locale.zh-CN.yaml
        # Skip It
        $yamlFileContents = Get-Content -Path $WINGET_LIBRARY_FOLDER$WINGET_MANIFEST | Select-String -pattern ".msix"
    }
}

```

```
Add-AppxPackage -Path ".msix"  -DeferRegistrationWhenPackagesAreInUse
```

---
## Assumed PreRequisites

You will be able to work without all of these things buy why suffer?

### gh cli


### VS Code


### VS Code Extensions

yaml

### PowerShell 7


---
## Folders

```text
C:\Apps
C:\tmp
```

Add these two folders as there is a great deal of files involved and short snappy paths
are just easier to work with.

You could rewrite this if you need to, but if they bother you, I would suggest just marking the folders
as Hidden and moving on.

---

## Batch/CMD Files

---

## Python Libraries/Tools

Python is here to stay, if you have avoided it thinking it's not the Microsoft way evidence is to the contrary.

<https://www.techrepublic.com/article/microsoft-is-boosting-its-support-for-the-python-programming-ecosystem/>
<https://devblogs.microsoft.com/python/supporting-the-python-community/>
<https://code.visualstudio.com/docs/languages/python>

### lastversion

This is probably one of the nicest bits of code you will ever see it
takes a fussy task and just dispenses with it almost totally.

```powershell


```


---

## CLI is NOT DOA

Command Line improvements are better than ever.

### clink

Will use clink for custom Auto-Complete of Package Names


---

## YAML Package Manifests

One of the best things about WinGet is the right in front of you Data.

It's not the easiest thing to bulk interact with.

Microsoft Caches it as a SQLite Database with a slightly complicated schema
optimised for saving file size with the full version history.

```
pushd C:\GH
gh repo clone https://github.com/microsoft/winget-pkgs/
```

### LastVersions Only

We run code over the RAW Manifests Discard all but the Last Version
this reduces the Number of Entries by at least 75%.

---


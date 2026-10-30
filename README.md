# FileAutomationLab

This project demonstrates a simple PowerShell file-management script.

## Files

- `FileAutomation.ps1` checks files in `sample-files` that were last modified more than seven days ago.
- `.gitignore` excludes temporary files and the `logs` folder.
- `sample-files` contains sample files for testing.

## Run the script

Open PowerShell in this folder and run:

```powershell
.\FileAutomation.ps1
```

The script uses `-WhatIf` to preview the copy operation without actually copying files.

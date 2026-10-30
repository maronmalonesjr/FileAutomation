$projectPath = $PSScriptRoot
$samplePath = Join-Path $projectPath "sample-files"
$archivePath = Join-Path $projectPath "archive"

if (-not (Test-Path $samplePath)) {
    New-Item -ItemType Directory -Path $samplePath | Out-Null
}

if (-not (Test-Path $archivePath)) {
    New-Item -ItemType Directory -Path $archivePath | Out-Null
}

$cutoffDate = (Get-Date).AddDays(-7)

Write-Host "File Automation Lab"
Write-Host "Files last modified before: $cutoffDate"
Write-Host ""

$oldFiles = Get-ChildItem -Path $samplePath -File |
    Where-Object { $_.LastWriteTime -lt $cutoffDate }

if ($oldFiles.Count -eq 0) {
    Write-Host "No files older than 7 days were found."
} else {
    Write-Host "Files that match the date condition:"
    $oldFiles | Select-Object Name, LastWriteTime

    Write-Host ""
    Write-Host "Testing the copy operation with -WhatIf:"
    $oldFiles | Copy-Item -Destination $archivePath -WhatIf
}

Write-Host ""
Write-Host "Script finished. No files were copied during the -WhatIf test."

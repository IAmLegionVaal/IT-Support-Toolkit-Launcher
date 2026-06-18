#requires -Version 5.1
<#
.SYNOPSIS
    IT Support Toolkit Launcher.
.DESCRIPTION
    Menu launcher for local troubleshooting scripts and GitHub portfolio repositories.
#>

$Repos = @(
    @{Name='Microsoft Office & Apps Troubleshooter'; Script='Microsoft_Office_Apps_Troubleshooter.ps1'; Url='https://github.com/IAmLegionVaal/Microsoft-Office-Apps-Troubleshooter'},
    @{Name='Windows Endpoint Health Check Toolkit'; Script='Windows_Endpoint_Health_Check_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/Windows-Endpoint-Health-Check-Toolkit'},
    @{Name='Network Troubleshooting Toolkit'; Script='Network_Troubleshooting_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/Network-Troubleshooting-Toolkit'},
    @{Name='Printer Troubleshooter Toolkit'; Script='Printer_Troubleshooter_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/Printer-Troubleshooter-Toolkit'},
    @{Name='Windows Update Repair Toolkit'; Script='Windows_Update_Repair_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/Windows-Update-Repair-Toolkit'},
    @{Name='Remote Support Evidence Collector'; Script='Remote_Support_Evidence_Collector.ps1'; Url='https://github.com/IAmLegionVaal/Remote-Support-Evidence-Collector'},
    @{Name='Active Directory User Audit Toolkit'; Script='AD_User_Audit_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/Active-Directory-User-Audit-Toolkit'},
    @{Name='Defender Security Baseline Checker'; Script='Defender_Security_Baseline_Checker.ps1'; Url='https://github.com/IAmLegionVaal/Defender-Security-Baseline-Checker'},
    @{Name='App Crash Analyzer Toolkit'; Script='App_Crash_Analyzer_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/App-Crash-Analyzer-Toolkit'},
    @{Name='Disk Cleanup Storage Analyzer'; Script='Disk_Cleanup_Storage_Analyzer.ps1'; Url='https://github.com/IAmLegionVaal/Disk-Cleanup-Storage-Analyzer'},
    @{Name='User Profile Repair Toolkit'; Script='User_Profile_Repair_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/User-Profile-Repair-Toolkit'},
    @{Name='Microsoft 365 Sign-In Outlook Toolkit'; Script='M365_SignIn_Outlook_Toolkit.ps1'; Url='https://github.com/IAmLegionVaal/Microsoft-365-SignIn-Outlook-Toolkit'}
)

function Show-Header {
    Clear-Host
    Write-Host '============================================================' -ForegroundColor Cyan
    Write-Host '   IT SUPPORT TOOLKIT LAUNCHER' -ForegroundColor Cyan
    Write-Host '============================================================' -ForegroundColor Cyan
    Write-Host "   Computer : $env:COMPUTERNAME"
    Write-Host "   User     : $env:USERDOMAIN\$env:USERNAME"
    Write-Host '============================================================' -ForegroundColor Cyan
    Write-Host
}

function Open-Repo {
    param([string]$Url)
    Start-Process $Url
}

function Start-LocalScript {
    param([string]$ScriptName)
    $scriptPath = Join-Path $PSScriptRoot $ScriptName
    if (Test-Path $scriptPath) {
        Start-Process powershell.exe -ArgumentList @('-ExecutionPolicy','Bypass','-File',"`"$scriptPath`"") -Verb RunAs
    } else {
        Write-Host "Local script not found beside launcher: $ScriptName" -ForegroundColor Yellow
    }
}

do {
    Show-Header
    for ($i = 0; $i -lt $Repos.Count; $i++) {
        Write-Host (' {0,2}. {1}' -f ($i + 1), $Repos[$i].Name)
    }
    Write-Host
    Write-Host ' R. Open all GitHub repositories page by page'
    Write-Host ' 0. Exit'
    Write-Host
    $choice = Read-Host 'Select toolkit number'
    if ($choice -match '^[Rr]$') {
        foreach ($repo in $Repos) { Open-Repo -Url $repo.Url; Start-Sleep -Milliseconds 500 }
        continue
    }
    $number = 0
    if ([int]::TryParse($choice, [ref]$number) -and $number -ge 1 -and $number -le $Repos.Count) {
        $selected = $Repos[$number - 1]
        Write-Host
        Write-Host "Selected: $($selected.Name)" -ForegroundColor Cyan
        Write-Host '1. Open GitHub repo'
        Write-Host '2. Run local script if present'
        Write-Host '0. Back'
        $action = Read-Host 'Choose action'
        switch ($action) {
            '1' { Open-Repo -Url $selected.Url }
            '2' { Start-LocalScript -ScriptName $selected.Script }
            default { }
        }
    } elseif ($choice -ne '0') {
        Write-Host 'Invalid choice.' -ForegroundColor Yellow
        Start-Sleep -Seconds 1
    }
} while ($choice -ne '0')

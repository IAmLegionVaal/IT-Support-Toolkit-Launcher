#Requires -Version 5.1
<#
.SYNOPSIS
    Read-only local MCP preflight. Does not call Gemini cloud.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()][string]$ServerScript,
    [ValidatePattern('^https?://(localhost|127\.0\.0\.1)(:\d+)?/')][string]$LocalApiUrl='http://localhost:1235/v1/models',
    [ValidateRange(1,30)][int]$TimeoutSeconds=5
)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
$node=Get-Command node -ErrorAction Stop
$entry=Get-Item -LiteralPath $ServerScript -ErrorAction Stop
if ($entry.Length -eq 0) { throw 'MCP server.mjs is zero bytes. Restore trusted source first.' }
try {
    & $node.Source --check $entry.FullName
    if ($LASTEXITCODE -ne 0) { throw 'Node syntax check failed.' }
    Write-Host 'Node syntax: passed'
} catch { throw ('Node preflight failed: {0}' -f $_.Exception.Message) }
try {
    $result=Invoke-WebRequest -Uri $LocalApiUrl -Method Get -TimeoutSec $TimeoutSeconds -UseBasicParsing -ErrorAction Stop
    Write-Host ('Local API HTTP status: {0}' -f [int]$result.StatusCode)
} catch { Write-Warning ('Local model API did not respond: {0}' -f $_.Exception.Message) }
Write-Warning 'MCP invocation, Gemini API availability, and search grounding remain unverified.'

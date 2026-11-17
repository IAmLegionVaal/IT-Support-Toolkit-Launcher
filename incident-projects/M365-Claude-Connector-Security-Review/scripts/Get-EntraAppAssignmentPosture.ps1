#Requires -Version 5.1
<#
.SYNOPSIS
    Read-only Entra service principal assignment requirement and count.
.DESCRIPTION
    Queries Enterprise Application assignment state; does not enumerate OAuth2
    consent scopes or execute any tenant modifications.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateCount(1, 30)]
    [string[]]$ApplicationIds
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
try {
    Import-Module Microsoft.Graph.Authentication -ErrorAction Stop
    Connect-MgGraph -Scopes @('Application.Read.All') -NoWelcome -ErrorAction Stop | Out-Null
    foreach ($appId in $ApplicationIds) {
        $parsed = [guid]::Empty
        if (-not [guid]::TryParse($appId, [ref]$parsed)) {
            Write-Warning ('Invalid appId ignored: {0}' -f $appId)
            continue
        }
        try {
            $filter = [uri]::EscapeDataString("appId eq '$appId'")
            $url = 'https://graph.microsoft.com/v1.0/servicePrincipals?$filter=' + $filter + '&$select=id,appId,displayName,appRoleAssignmentRequired'
            $response = Invoke-MgGraphRequest -Method GET -Uri $url -ErrorAction Stop
            foreach ($app in @($response.value)) {
                if ($null -eq $app) { continue }
                $count = 0
                $next = 'https://graph.microsoft.com/v1.0/servicePrincipals/' + $app.id + '/appRoleAssignedTo'
                while ($next) {
                    $page = Invoke-MgGraphRequest -Method GET -Uri $next -ErrorAction Stop
                    if ($page.value) { $count += @($page.value).Count }
                    $next = $page.'@odata.nextLink'
                }
                [pscustomobject]@{
                    DisplayName = $app.displayName
                    ApplicationId = $app.appId
                    AssignmentRequired = $app.appRoleAssignmentRequired
                    AssignedPrincipalCount = $count
                }
            }
        } catch {
            Write-Warning ('Audit failed for appId {0}: {1}' -f $appId, $_.Exception.Message)
        }
    }
} catch {
    Write-Error ('Graph audit unavailable: {0}' -f $_.Exception.Message)
    throw
}

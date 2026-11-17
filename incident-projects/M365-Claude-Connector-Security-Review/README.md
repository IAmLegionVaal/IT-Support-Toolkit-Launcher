# Entra and Microsoft Graph review for third-party AI connector

**Status: initial deployment completed, provider-side activation/final acceptance outstanding.** An M365 AI integration used multiple Enterprise Applications, with delegated mail/calendar/Teams/files/sites scopes and nine nominated user assignments on selected MCP applications.

## Implemented
- MCP Client and Server configured, admin consent granted, required assignment enabled for selected apps.
- Nine users assigned; Office/Outlook add-ins deployed.
- Existing MFA and Conditional Access were retained; no new CA policy was added.
- Service owner still needed to enable M365 connector in the assistant's Team admin settings and final user testing had not occurred.

## Sensitive permission examples
`Mail.Read`, `Mail.ReadWrite`, `Mail.Send`, `Calendars.ReadWrite`, `Chat.ReadWrite`, `ChannelMessage.Send`, `Files.Read.All`, `Files.ReadWrite.All`, `Sites.ReadWrite.All`, `offline_access`.

These are examples of **delegated** permissions to review. Do not confuse delegated user-context grants with tenant-wide application permissions.

## Read-only audit procedure
1. Inventory **all** enterprise service principal objects, not just the app visible in the add-in page.
2. For each app, identify client appId vs object ID, `appRoleAssignmentRequired`, user/group/app assignments.
3. Enumerate `oauth2PermissionGrants` separately from application `appRoleAssignments` to understand delegated vs app-only scope.
4. Cross-check Graph permissions against actual approved data flows and provider retention.
5. Use sign-in logs to verify MFA/Conditional Access. Test both assigned and unassigned identities.
6. Confirm add-in assignment, provider-side connector enabled, and functional pilot tests.
7. Change/remove grants only through approved change control. Maintain rollback and credential/tokens revocation plan.

## Example report script
```powershell
.\scripts\Get-EntraAppAssignmentPosture.ps1 -ApplicationIds @('00000000-0000-0000-0000-000000000000')
```
Requires Microsoft.Graph.Authentication and delegated `Application.Read.All`; prompts for authorized sign-in. Does not grant or revoke consent. Does not prove provider-side connector access.

Microsoft references: [app assignments](https://learn.microsoft.com/en-us/graph/api/serviceprincipal-list-approleassignedto), [delegated permission grants](https://learn.microsoft.com/en-us/graph/api/oauth2permissiongrant-list), [application grants](https://learn.microsoft.com/en-us/graph/api/serviceprincipal-list-approleassignments).

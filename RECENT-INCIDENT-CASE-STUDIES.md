# Recent real-world incident case studies (November 2026)

These cases were anonymized before publication. No customer names, tenant identifiers, IP addresses, original credentials, VPN private keys, certificate packages or connection strings were included.

The linked toolkits received **new case study documents and reusable diagnostic scripts**. The verification column deliberately distinguishes restored service from pending investigations.

| Case | Case study | Script | Original verification |
| --- | --- | --- | --- |
| Fibre latency and packet loss | [Investigation](https://github.com/IAmLegionVaal/Network-Troubleshooting-Toolkit/blob/main/case-studies/2026-11-fibre-packet-loss.md) | [ICMP evidence collector](https://github.com/IAmLegionVaal/Network-Troubleshooting-Toolkit/blob/main/examples/Test-PacketLossEvidence.ps1) | ISP confirmed loss; repair pending |
| WireGuard to named SQL Server instance / ODBC 18 | [Investigation](https://github.com/IAmLegionVaal/VPN-Connectivity-Diagnostic-Toolkit/blob/main/case-studies/2026-11-wireguard-odbc-sql.md) | [SQL Browser and TCP probe](https://github.com/IAmLegionVaal/VPN-Connectivity-Diagnostic-Toolkit/blob/main/examples/Test-SqlBrowserPath.ps1) | Application recovery not yet verified |
| USB printer re-detection and defaults | [Recovery notes](https://github.com/IAmLegionVaal/Printer-Troubleshooter-Toolkit/blob/main/case-studies/2026-11-usb-printer-recovery.md) | [Audit / opt-in defaults](https://github.com/IAmLegionVaal/Printer-Troubleshooter-Toolkit/blob/main/examples/Get-UsbPrinterRecoveryEvidence.ps1) | Windows test page printed |
| SharePoint moved folder and local sync stale path | [Recovery notes](https://github.com/IAmLegionVaal/Teams-OneDrive-Sync-Diagnostic-Toolkit/blob/main/case-studies/2026-11-moved-sharepoint-folder-recovery.md) | [Client evidence](https://github.com/IAmLegionVaal/Teams-OneDrive-Sync-Diagnostic-Toolkit/blob/main/examples/Get-OneDriveClientEvidence.ps1) | Restore / resync pending |

## Separate repository projects prepared

These problems merit stand-alone, narrowly scoped projects rather than duplicating broad Windows toolkits.

1. `macOS-Client-Certificate-Auth-Repair` — Chrome client certificate/keychain authentication: resolved.
2. `Moodle-DirectAdmin-CLI-Cron` — minute-by-minute Moodle cron: running; custom plugin language warning separately identified.
3. `Bionic-Gemini-MCP-Diagnostics` — local Node MCP preflight and upstream Gemini timeout: incomplete.
4. `WordPress-LiteSpeed-503-Triage` — PHP/hosting resource analysis: sustained fix not verified.
5. `M365-Claude-Connector-Security-Review` — delegated consent, nine-user assignment and third-party AI access review: final test pending.

The new-repository creation action is not exposed by the connected GitHub integration, so these five remain **prepared for publication**, not yet created on GitHub. Their complete starter packs and explicit publish script were generated separately for authenticated GitHub CLI publication.

## Operational standard for future cases

Every case should preserve: symptom and scope; real observed evidence; root-cause hypothesis vs confirmed cause; commands actually used; separately identified new reusable scripts; risk/rollback; validation outcome; and unresolved follow-ups.

Do not label a workaround, diagnostic script, or untested change as a confirmed fix.

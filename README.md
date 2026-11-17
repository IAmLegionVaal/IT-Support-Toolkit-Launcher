> **Publication update — 17 November 2026:** All five standalone public repositories are published and their GitHub Actions checks passed. See the [verified repository index and CI evidence](INCIDENT-REPOSITORIES.md). Earlier “not created/prepared” statements below are historical records superseded by that report. CI success does not change incident outcomes.

# IT Support Toolkit Launcher

A PowerShell launcher and portfolio hub for Dewald Pretorius / Dtech IT Solutions support toolkits.

## What it does

- Shows a menu of IT support toolkit projects
- Opens related GitHub repositories
- Runs local scripts when they exist beside the launcher
- Keeps your troubleshooting toolkit suite easy to present and navigate

## Included toolkit links

- Microsoft Office & Apps Troubleshooter
- Windows Endpoint Health Check Toolkit
- Network Troubleshooting Toolkit
- Printer Troubleshooter Toolkit
- Windows Update Repair Toolkit
- Remote Support Evidence Collector
- Active Directory User Audit Toolkit
- Defender Security Baseline Checker
- App Crash Analyzer Toolkit
- Disk Cleanup Storage Analyzer
- User Profile Repair Toolkit
- Microsoft 365 Sign-In Outlook Toolkit

## How to run

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\IT_Support_Toolkit_Launcher.ps1
```

## Safety

The launcher itself does not modify the system. It either opens GitHub pages or starts scripts that are already present locally.

## Suggested topics

```text
powershell
helpdesk
it-support
sysadmin
windows
troubleshooting
portfolio
```

## Real-world support incidents and portfolio audit (November 2026)

- [Incident case-study index](RECENT-INCIDENT-CASE-STUDIES.md) — four field cases committed into their existing toolkits, each with an accompanying diagnostic script.
- [Five staged standalone projects](incident-projects/README.md) — macOS client certificate authentication, DirectAdmin Moodle cron, Bionic Gemini MCP, WordPress LiteSpeed 503, and Microsoft 365 AI connector security review. Separate repositories are **not created yet**; this folder makes the published material browsable.
- [Structural audit of 100 public repositories](PORTFOLIO-AUDIT-2026-11-17.md) — tests, CI, root licences and prioritized remediation backlog.

**Safety:** Cases are anonymized; no production credentials, private keys, raw customer logs, tenant IDs or private URLs. All diagnostic scripts require review; syntax/CI success is not equivalent to end-to-end incident resolution.

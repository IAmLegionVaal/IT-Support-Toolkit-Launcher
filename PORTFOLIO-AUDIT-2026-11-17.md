# Repository portfolio structural audit — 2026-11-17

**Owner:** `IAmLegionVaal`. **Audit scope:** 100 accessible public repositories, default branch (`main`), including tracked Git trees. Counts are based on file path inventories at review time. These are not source-code security assessments, execution tests, or production validation.

## Result summary

| Structural signal | Count | Interpretation |
| --- | ---: | --- |
| Repositories inspected | 100 | 100 Git tree calls returned file inventories |
| Repositories with no `tests/`, `test/`, `spec/` or `specs/` directory | 100 | Dedicated automated behavior tests absent at scan time |
| Repositories without a tracked workflow under `.github/workflows/` | 46 | No GitHub Actions CI file visible |
| Repositories without a root `LICENSE` / `LICENSE.md` / `LICENSE.txt` | 30 | No root license file visible; review intended redistribution rights |
| Repositories recently given Pester tests and CI | 4 | Network, VPN, Printer, Teams-OneDrive |

The **four recently updated** repositories now have Pester static QA and CI added **after** the inventory snapshot. The original 100-without-tests figure therefore describes the baseline, **not** the current after-state. Their workflow outcomes and execution tests still need verification.

## Priority ranking

### P0: potentially high-impact system-change tooling — require review before running

- [Incident Response Triage Toolkit](https://github.com/IAmLegionVaal/Incident-Response-Triage-Toolkit): only two tracked files; missing license, CI and test directory. Perform threat-model and failure-path review before using in an incident.
- [Windows Print Server Health Toolkit](https://github.com/IAmLegionVaal/Windows-Print-Server-Health-Toolkit): no CI/tests/license; queue and spooler changes may affect all users.
- [RDP Remote Access Diagnostic Toolkit](https://github.com/IAmLegionVaal/RDP-Remote-Access-Diagnostic-Toolkit): no CI/tests/license; validate it never weakens NLA/firewall or opens public inbound access by default.
- [SMB NTFS Permissions Reporter](https://github.com/IAmLegionVaal/SMB-NTFS-Permissions-Reporter): no CI/tests/license; require read-only default and sensitive ACL redaction.
- [DHCP Scope Audit Toolkit](https://github.com/IAmLegionVaal/DHCP-Scope-Audit-Toolkit) / [DNS Zone Health Check Toolkit](https://github.com/IAmLegionVaal/DNS-Zone-Health-Check-Toolkit): no CI/tests/license; ensure no unintended zone or scope mutations.
- [M365 Tenant Health Assessment Toolkit](https://github.com/IAmLegionVaal/M365-Tenant-Health-Assessment-Toolkit): no license/tests; audit Graph permission requirements and credential handling.
- [SharePoint OneDrive Permissions Audit Toolkit](https://github.com/IAmLegionVaal/SharePoint-OneDrive-Permissions-Audit-Toolkit): no license/tests; verify any repair mode uses dry-run/change approval, especially tenant-wide permission changes.

These are **review priorities**, not evidence of malware or a confirmed vulnerability.

### P1: testing and automation

- Add a deterministic syntax/static Pester suite and Windows runner CI to every PowerShell repository.
- Split read-only discovery from opt-in remediation; prevent CI from executing production mutations.
- Add behavior tests for parsers, validation rules, retries/timeouts, path sanitization and rollback flags.
- Add PSScriptAnalyzer gradually, triage findings without blind bulk refactoring.
- Avoid copying the same unversioned runner scripts across 100 repositories indefinitely; consider a shared reusable workflow pinned to a reviewed version.
- Require least-privilege GitHub Actions `permissions: contents: read`; don't expose credentials to pull request workflows.

### P2: documentation and release hygiene

- Add root licenses after choosing an actual licensing policy and verifying ownership; **do not assume MIT** without review.
- Standardize prerequisites, supported PowerShell editions, `-WhatIf` examples, expected output, exit codes, rollback, changelog and incident applicability.
- State clearly when a case was not fixed or only partially tested.
- Set release tags / change logs once tests are stable.

## Repositories with no root licence file (30)

- [Windows-Scripts---I-found-usefull](https://github.com/IAmLegionVaal/Windows-Scripts---I-found-usefull)
- [Windows-Troubleshooter-Toolki](https://github.com/IAmLegionVaal/Windows-Troubleshooter-Toolki)
- [Microsoft-Office-Apps-Troubleshooter](https://github.com/IAmLegionVaal/Microsoft-Office-Apps-Troubleshooter)
- [Software-Inventory-Audit-Toolkit](https://github.com/IAmLegionVaal/Software-Inventory-Audit-Toolkit)
- [Endpoint-Onboarding-Checklist-Toolkit](https://github.com/IAmLegionVaal/Endpoint-Onboarding-Checklist-Toolkit)
- [Certificate-TLS-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Certificate-TLS-Diagnostic-Toolkit)
- [Advanced-Windows-Root-Cause-Analyzer](https://github.com/IAmLegionVaal/Advanced-Windows-Root-Cause-Analyzer)
- [M365-Tenant-Health-Assessment-Toolkit](https://github.com/IAmLegionVaal/M365-Tenant-Health-Assessment-Toolkit)
- [Active-Directory-Health-Check-Toolkit](https://github.com/IAmLegionVaal/Active-Directory-Health-Check-Toolkit)
- [Group-Policy-Troubleshooting-Toolkit](https://github.com/IAmLegionVaal/Group-Policy-Troubleshooting-Toolkit)
- [Windows-Deployment-Readiness-Toolkit](https://github.com/IAmLegionVaal/Windows-Deployment-Readiness-Toolkit)
- [PowerShell-Remote-Support-Framework](https://github.com/IAmLegionVaal/PowerShell-Remote-Support-Framework)
- [Intune-Enrollment-Troubleshooting-Toolkit](https://github.com/IAmLegionVaal/Intune-Enrollment-Troubleshooting-Toolkit)
- [AzureAD-Entra-Device-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/AzureAD-Entra-Device-Diagnostic-Toolkit)
- [Network-Path-Analyzer-Toolkit](https://github.com/IAmLegionVaal/Network-Path-Analyzer-Toolkit)
- [Firewall-Port-Connectivity-Matrix](https://github.com/IAmLegionVaal/Firewall-Port-Connectivity-Matrix)
- [Server-Health-Check-Toolkit](https://github.com/IAmLegionVaal/Server-Health-Check-Toolkit)
- [Incident-Response-Triage-Toolkit](https://github.com/IAmLegionVaal/Incident-Response-Triage-Toolkit)
- [Exchange-Online-Mail-Flow-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Exchange-Online-Mail-Flow-Diagnostic-Toolkit)
- [SharePoint-OneDrive-Permissions-Audit-Toolkit](https://github.com/IAmLegionVaal/SharePoint-OneDrive-Permissions-Audit-Toolkit)
- [Teams-Meeting-Quality-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Teams-Meeting-Quality-Diagnostic-Toolkit)
- [Windows-Print-Server-Health-Toolkit](https://github.com/IAmLegionVaal/Windows-Print-Server-Health-Toolkit)
- [Hyper-V-VM-Health-Check-Toolkit](https://github.com/IAmLegionVaal/Hyper-V-VM-Health-Check-Toolkit)
- [Windows-Failover-Cluster-Readiness-Checker](https://github.com/IAmLegionVaal/Windows-Failover-Cluster-Readiness-Checker)
- [DHCP-Scope-Audit-Toolkit](https://github.com/IAmLegionVaal/DHCP-Scope-Audit-Toolkit)
- [DNS-Zone-Health-Check-Toolkit](https://github.com/IAmLegionVaal/DNS-Zone-Health-Check-Toolkit)
- [File-Share-Permissions-Audit-Toolkit](https://github.com/IAmLegionVaal/File-Share-Permissions-Audit-Toolkit)
- [SMB-NTFS-Permissions-Reporter](https://github.com/IAmLegionVaal/SMB-NTFS-Permissions-Reporter)
- [Windows-Credential-Provider-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Windows-Credential-Provider-Diagnostic-Toolkit)
- [RDP-Remote-Access-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/RDP-Remote-Access-Diagnostic-Toolkit)

## Repositories with no CI workflow at baseline (46)

- [Windows-Scripts](https://github.com/IAmLegionVaal/Windows-Scripts)
- [Windows-Scripts---I-found-usefull](https://github.com/IAmLegionVaal/Windows-Scripts---I-found-usefull)
- [Remote-Support-Evidence-Collector](https://github.com/IAmLegionVaal/Remote-Support-Evidence-Collector)
- [Active-Directory-User-Audit-Toolkit](https://github.com/IAmLegionVaal/Active-Directory-User-Audit-Toolkit)
- [App-Crash-Analyzer-Toolkit](https://github.com/IAmLegionVaal/App-Crash-Analyzer-Toolkit)
- [Disk-Cleanup-Storage-Analyzer](https://github.com/IAmLegionVaal/Disk-Cleanup-Storage-Analyzer)
- [User-Profile-Repair-Toolkit](https://github.com/IAmLegionVaal/User-Profile-Repair-Toolkit)
- [Microsoft-365-SignIn-Outlook-Toolkit](https://github.com/IAmLegionVaal/Microsoft-365-SignIn-Outlook-Toolkit)
- [Windows-Event-Log-Triage-Toolkit](https://github.com/IAmLegionVaal/Windows-Event-Log-Triage-Toolkit)
- [Windows-Service-Health-Checker](https://github.com/IAmLegionVaal/Windows-Service-Health-Checker)
- [Software-Inventory-Audit-Toolkit](https://github.com/IAmLegionVaal/Software-Inventory-Audit-Toolkit)
- [Local-Admin-Audit-Toolkit](https://github.com/IAmLegionVaal/Local-Admin-Audit-Toolkit)
- [DNS-DHCP-Troubleshooting-Toolkit](https://github.com/IAmLegionVaal/DNS-DHCP-Troubleshooting-Toolkit)
- [Endpoint-Onboarding-Checklist-Toolkit](https://github.com/IAmLegionVaal/Endpoint-Onboarding-Checklist-Toolkit)
- [Helpdesk-Ticket-Template-Generator](https://github.com/IAmLegionVaal/Helpdesk-Ticket-Template-Generator)
- [Incident-Response-Triage-Toolkit](https://github.com/IAmLegionVaal/Incident-Response-Triage-Toolkit)
- [Windows-Print-Server-Health-Toolkit](https://github.com/IAmLegionVaal/Windows-Print-Server-Health-Toolkit)
- [Hyper-V-VM-Health-Check-Toolkit](https://github.com/IAmLegionVaal/Hyper-V-VM-Health-Check-Toolkit)
- [Windows-Failover-Cluster-Readiness-Checker](https://github.com/IAmLegionVaal/Windows-Failover-Cluster-Readiness-Checker)
- [DHCP-Scope-Audit-Toolkit](https://github.com/IAmLegionVaal/DHCP-Scope-Audit-Toolkit)
- [DNS-Zone-Health-Check-Toolkit](https://github.com/IAmLegionVaal/DNS-Zone-Health-Check-Toolkit)
- [File-Share-Permissions-Audit-Toolkit](https://github.com/IAmLegionVaal/File-Share-Permissions-Audit-Toolkit)
- [SMB-NTFS-Permissions-Reporter](https://github.com/IAmLegionVaal/SMB-NTFS-Permissions-Reporter)
- [Windows-Credential-Provider-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Windows-Credential-Provider-Diagnostic-Toolkit)
- [RDP-Remote-Access-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/RDP-Remote-Access-Diagnostic-Toolkit)
- [Windows-Blue-Screen-Crash-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Windows-Blue-Screen-Crash-Diagnostic-Toolkit)
- [PowerShell-Log-Collection-Framework](https://github.com/IAmLegionVaal/PowerShell-Log-Collection-Framework)
- [Windows-Driver-Health-Check-Toolkit](https://github.com/IAmLegionVaal/Windows-Driver-Health-Check-Toolkit)
- [Server-Capacity-Planning-Toolkit](https://github.com/IAmLegionVaal/Server-Capacity-Planning-Toolkit)
- [Active-Directory-Lockout-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Active-Directory-Lockout-Diagnostic-Toolkit)
- [Windows-Time-Sync-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Windows-Time-Sync-Diagnostic-Toolkit)
- [Certificate-Expiry-Monitoring-Toolkit](https://github.com/IAmLegionVaal/Certificate-Expiry-Monitoring-Toolkit)
- [Microsoft-365-License-Audit-Toolkit](https://github.com/IAmLegionVaal/Microsoft-365-License-Audit-Toolkit)
- [Exchange-Mailbox-Health-Toolkit](https://github.com/IAmLegionVaal/Exchange-Mailbox-Health-Toolkit)
- [SharePoint-Site-Inventory-Toolkit](https://github.com/IAmLegionVaal/SharePoint-Site-Inventory-Toolkit)
- [Endpoint-Network-Latency-Monitor](https://github.com/IAmLegionVaal/Endpoint-Network-Latency-Monitor)
- [Windows-Task-Scheduler-Audit-Toolkit](https://github.com/IAmLegionVaal/Windows-Task-Scheduler-Audit-Toolkit)
- [Windows-Event-Correlation-Analyzer](https://github.com/IAmLegionVaal/Windows-Event-Correlation-Analyzer)
- [Windows-Boot-Performance-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Windows-Boot-Performance-Diagnostic-Toolkit)
- [Windows-Storage-IO-Diagnostic-Toolkit](https://github.com/IAmLegionVaal/Windows-Storage-IO-Diagnostic-Toolkit)
- [Windows-Network-Adapter-Health-Toolkit](https://github.com/IAmLegionVaal/Windows-Network-Adapter-Health-Toolkit)
- [Windows-DNS-Resolution-Test-Suite](https://github.com/IAmLegionVaal/Windows-DNS-Resolution-Test-Suite)
- [Windows-Service-Dependency-Mapper](https://github.com/IAmLegionVaal/Windows-Service-Dependency-Mapper)
- [BitLocker-Recovery-Readiness-Toolkit](https://github.com/IAmLegionVaal/BitLocker-Recovery-Readiness-Toolkit)
- [Defender-Event-Triage-Toolkit](https://github.com/IAmLegionVaal/Defender-Event-Triage-Toolkit)
- [Firewall-Rule-Inventory-Toolkit](https://github.com/IAmLegionVaal/Firewall-Rule-Inventory-Toolkit)

## Recent incident commits

| Repository | Case | Script | New QA |
| --- | --- | --- | --- |
| Network Troubleshooting Toolkit | Fibre packet loss | `Test-PacketLossEvidence.ps1` | Pester static + CI |
| VPN Connectivity Diagnostic Toolkit | WireGuard/SQL/ODBC | `Test-SqlBrowserPath.ps1` | Pester static + CI |
| Printer Troubleshooter Toolkit | USB printer | `Get-UsbPrinterRecoveryEvidence.ps1` | Pester static + CI |
| Teams OneDrive Sync Diagnostic Toolkit | Moved SharePoint folder | `Get-OneDriveClientEvidence.ps1` | Pester static + CI |

### Safe execution criteria
Script successfully parses; parameter/invalid-input tests pass; privilege and side-effect boundaries documented; read-only default; no hardcoded secrets; deterministic evidence; maintenance-mode confirmation and rollback for remediation; test output redacted; production change approved. **CI syntax success is not proof of endpoint, tenant, server, or ISP remediation.**

## Current limitation
The connected GitHub application can commit to existing repositories but does **not** expose the create-repository endpoint. Five new standalone incidents have been published as [staged project directories](incident-projects/README.md), and a separate ZIP can create five independent repos through authenticated GitHub CLI from the user's workstation. This document does not claim those five independent repos exist.

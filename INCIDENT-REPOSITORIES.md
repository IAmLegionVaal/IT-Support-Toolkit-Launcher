# Standalone incident repositories — verified publication

Verified on 17 November 2026. All five repositories are public under IAmLegionVaal.
This report supersedes earlier "prepared/not created" publication statements;
the earlier staged files and audit records are preserved as historical snapshots.

| Public repository | Verified commit | CI | Historical incident state |
| --- | --- | --- | --- |
| [macOS-Client-Certificate-Auth-Repair](https://github.com/IAmLegionVaal/macOS-Client-Certificate-Auth-Repair) | [f40f4c9](https://github.com/IAmLegionVaal/macOS-Client-Certificate-Auth-Repair/commit/f40f4c9db161829054974518a029eeb09358ecae) | [Passed](https://github.com/IAmLegionVaal/macOS-Client-Certificate-Auth-Repair/actions/runs/44076503903) | Source case: browser access restored; not independently retested |
| [Moodle-DirectAdmin-CLI-Cron](https://github.com/IAmLegionVaal/Moodle-DirectAdmin-CLI-Cron) | [65012fb](https://github.com/IAmLegionVaal/Moodle-DirectAdmin-CLI-Cron/commit/65012fb347a9f32e0ce24ba0e9af0c07a315dec9) | [Passed](https://github.com/IAmLegionVaal/Moodle-DirectAdmin-CLI-Cron/actions/runs/44076519461) | Cron execution confirmed; custom plugin warning remains open |
| [Bionic-Gemini-MCP-Diagnostics](https://github.com/IAmLegionVaal/Bionic-Gemini-MCP-Diagnostics) | [09bc886](https://github.com/IAmLegionVaal/Bionic-Gemini-MCP-Diagnostics/commit/09bc886cff96d8eb194a6b910bc406c706b36ae9) | [Passed](https://github.com/IAmLegionVaal/Bionic-Gemini-MCP-Diagnostics/actions/runs/44076535730) | Gemini timeout unresolved; grounding unverified |
| [WordPress-LiteSpeed-503-Triage](https://github.com/IAmLegionVaal/WordPress-LiteSpeed-503-Triage) | [34b61d7](https://github.com/IAmLegionVaal/WordPress-LiteSpeed-503-Triage/commit/34b61d74d055168883db0358e0e1a728fbecd3a2) | [Passed](https://github.com/IAmLegionVaal/WordPress-LiteSpeed-503-Triage/actions/runs/44076553089) | Sustained recovery unverified |
| [M365-Claude-Connector-Security-Review](https://github.com/IAmLegionVaal/M365-Claude-Connector-Security-Review) | [e49ebe5](https://github.com/IAmLegionVaal/M365-Claude-Connector-Security-Review/commit/e49ebe54ce3b8fd54c71568f7ee1bec6ff56aca9) | [Passed](https://github.com/IAmLegionVaal/M365-Claude-Connector-Security-Review/actions/runs/44076566597) | Provider activation and final acceptance unverified |

## Published contents and checks

Each repository contains 11 files: expanded anonymized README, read-only diagnostic,
MIT LICENSE, provenance, security guidance, testing limits, ignore rules, line-ending
rules, a pinned checkout workflow, a hygiene checker, and behavioral tests.
All 55 published text files were fetched at the listed commits and matched the
reviewed publication content. Public visibility and file inventories were checked.

All five Actions runs completed successfully, including hygiene/syntax and isolated
behavioral tests: macOS 3, Moodle 4, MCP 6, WordPress 4, M365 7 (24 total).
The WordPress real PHP CLI test ran successfully rather than being skipped.
PowerShell regressions also passed locally on Windows under PowerShell 7.
macOS commands and Graph requests were mocked; no actual keychain or tenant
was accessed. No production remediation was performed.

Tests cover missing inputs, failure propagation, safe command arguments, synthetic
log counting, localhost request controls, wrong-tenant rejection, pagination
counts and hostile/repeated pagination links. The heuristic credential scan has
limited patterns; it does not guarantee absence of every possible secret.
CI currently emits a checkout v4 Node runtime deprecation warning, but all checks
pass; action/runtime modernization remains a maintenance item.

## Source and rights

The expanded ZIP referenced in the earlier chat could not be recovered through
the available attachment interface. These repositories were rebuilt from staged
source at central commit `2e24407c80b037c0efb47eb8e571024a35cc9840`.
The source's explicit MIT declaration and copyright attribution were preserved
with full standard license text. No new license was imposed on unrelated repos.

The standalone scripts include hardening beyond the staged versions: macOS
security errors propagate; Moodle avoids truncating PHP version output through a
pipe; MCP disables redirects and fails failed local checks; the M365 audit uses
an existing authorized session, validates tenant/pagination and omits identifiers
from its output. The M365 narrative omits deployment details and assignment counts.

## Still open

- Native macOS and Windows PowerShell 5.1 validation and representative hosting tests.
- Moodle plugin warning and end-to-end certificate issuance.
- MCP tool-call timeout handling and independently verified grounding.
- WordPress sustained performance and 503 acceptance window.
- Provider-side M365 activation and approved functional/access tests.
- The broader portfolio remediation backlog in issue #1.

A green diagnostic workflow is not a production incident resolution.
[Central index](incident-projects/README.md) · [Case studies](RECENT-INCIDENT-CASE-STUDIES.md) · [Tracker](https://github.com/IAmLegionVaal/IT-Support-Toolkit-Launcher/issues/1)

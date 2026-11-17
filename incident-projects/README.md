> **Publication update — 17 November 2026:** All five standalone public repositories are published and their GitHub Actions checks passed. See the [verified repository index and CI evidence](../INCIDENT-REPOSITORIES.md). Earlier “not created/prepared” statements below are historical records superseded by that report. CI success does not change incident outcomes.

# Real-world IT incident projects — November 2026

This is a **staging collection** inside the existing IT-Support-Toolkit-Launcher repository. These are **not** separate GitHub repositories yet: the connected GitHub integration can update existing repositories but cannot create repositories.

Every case contains an anonymized incident, evidence that distinguishes facts from hypotheses, a reproducible diagnostic workflow, risk controls, and explicit acceptance criteria. Diagnostic scripts must be reviewed before use on real systems.

| Project | Last confirmed incident state |
| --- | --- |
| [macOS browser mTLS certificate](macOS-Client-Certificate-Auth-Repair/README.md) | Browser access restored |
| [Moodle DirectAdmin cron](Moodle-DirectAdmin-CLI-Cron/README.md) | Cron ran successfully; custom plugin warning separate |
| [Bionic / Gemini MCP](Bionic-Gemini-MCP-Diagnostics/README.md) | Tool registered; cloud request timed out |
| [WordPress / LiteSpeed 503](WordPress-LiteSpeed-503-Triage/README.md) | Hosting limits changed; sustained fix unverified |
| [M365 AI app access](M365-Claude-Connector-Security-Review/README.md) | Nine users scoped; provider-side activation and testing pending |

## Validation scope
Static Bash and packaging checks ran offline for the starter ZIP. PowerShell scripts and environment-specific commands require validation on target systems. No customer identifiers, production tokens, PFX files, original connection strings, or tenant-specific logs are stored here.

## Separate repository publication
Use the separate ZIP's `Publish-NewCaseRepos.ps1` script locally after reviewing it and authenticating the GitHub CLI. It defaults to dry run; `-Publish` is needed for repository creation. Never commit private client information.

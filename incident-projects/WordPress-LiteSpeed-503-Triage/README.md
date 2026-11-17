# WordPress / LiteSpeed / Elementor / UpdraftPlus 503 triage

**Status: sustained remediation not verified.** WordPress admin editing and backup activity were associated with lag and HTTP 503. DirectAdmin/LiteSpeed hosting resources were adjusted, but a stable production recovery is not established.

## Actual incident settings (not general recommendations)
| Setting | Observed |
| --- | --- |
| PHP | 8.4 |
| max_execution_time | 600 seconds |
| memory_limit | 512M per PHP process |
| post_max_size | 512M |
| upload_max_filesize | 128M |
| CPU quota | 200% / about 2 cores |
| Account memory quota | ~1.2 GB |

Three 512M-memory-hungry processes may collectively exceed a 1.2 GB account cap. Increasing `memory_limit` and execution time can worsen saturation.

## Evidence-driven workflow
1. Reproduce under approved conditions and correlate HTTP 503 with LiteSpeed/error logs, resource throttling and PHP worker count.
2. Distinguish web SAPI from CLI settings; CLI `php -i` alone does not prove LiteSpeed's effective settings.
3. Monitor CPU, account RAM, IO, database connections, process limits and backup schedule.
4. Stage plugin/backup/cache experiments one variable at a time; verify PHP 8.4 compatibility.
5. Compare baseline and post-change p95 response time, 503 rate, backup duration and Elementor save success.
6. Retain rollback values for quotas and PHP settings.

## Read-only CLI context
```bash
PHP_BIN=php bash scripts/inspect-php-cli-limits.sh
```
Do not publicly expose `phpinfo()`, server error logs, wp-config.php, backup archives or API credentials.

## Acceptance
Elementor and backup finish successfully over a representative period, without new 503s or resource saturation. Not proven in original case.

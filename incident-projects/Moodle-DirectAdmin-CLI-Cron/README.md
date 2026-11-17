# Moodle CLI cron on DirectAdmin

**Status: confirmed cron execution; custom certificate plugin warning unresolved.** The host was configured to invoke Moodle's `admin/cli/cron.php` each minute. Original environment used `/usr/local/php81/bin/php81`, which is server-specific; choose the PHP version supported by your current Moodle release.

## What worked
A new cron job was configured without overwriting two preexisting jobs. Multiple CLI log runs showed `Cron run completed correctly`. The `customcert` component logged `Invalid get_string() identifier: 'taskissuecertificate'`, then later showed the `mod_customcert\task\issue_certificates_task` scheduled task running/completing. A scheduled task completing does not guarantee the plugin's language string or certificate issuance is correct.

## Deployment runbook
1. Record the account's current crontab in **private** controlled storage.
2. Determine actual PHP CLI, Moodle root, correct restricted run-as user and existing cron entries.
3. Schedule the CLI cron for every minute. Never run as root in shared hosting.
4. Redirect output to an owner-readable log and configure rotation.
5. Review log completion markers plus Moodle Admin > Server > Tasks > Scheduled tasks.
6. Ask the LMS provider to investigate customcert language strings and plugin compatibility separately.

Example (placeholders must be replaced):
```cron
* * * * * /usr/local/php81/bin/php81 /home/ACCOUNT/domains/EXAMPLE_DOMAIN/public_html/admin/cli/cron.php >> /home/ACCOUNT/moodle-cron-cli.log 2>&1
```

## Read-only check
```bash
MOODLE_ROOT="$HOME/domains/EXAMPLE_DOMAIN/public_html" PHP_BIN=/usr/local/php81/bin/php81 LOG_FILE="$HOME/moodle-cron-cli.log" bash scripts/check-moodle-cron.sh
```

## Safety
Do not publish LMS student data, web roots, user names, full configuration exports or cron logs. Use [Moodle CLI guidance](https://docs.moodle.org/en/Administration_via_command_line) and [scheduled task guidance](https://docs.moodle.org/en/Scheduled_tasks) to confirm appropriate versions.

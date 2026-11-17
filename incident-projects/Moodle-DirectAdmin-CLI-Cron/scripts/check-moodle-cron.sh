#!/usr/bin/env bash
set -euo pipefail
: "${MOODLE_ROOT:?MOODLE_ROOT is required}"
PHP_BIN="${PHP_BIN:-php}"
LOG_FILE="${LOG_FILE:-$HOME/moodle-cron-cli.log}"
if [[ ! -f "$MOODLE_ROOT/admin/cli/cron.php" ]]; then
  printf '%s\n' 'Moodle CLI entrypoint missing' >&2
  exit 2
fi
if ! command -v "$PHP_BIN" >/dev/null 2>&1; then
  printf '%s\n' 'PHP CLI not found' >&2
  exit 2
fi
if [[ ! -r "$LOG_FILE" ]]; then
  printf '%s\n' 'Cron log not readable' >&2
  exit 2
fi
"$PHP_BIN" --version | head -n 1
printf 'Successful completion markers: '
grep -cF 'Cron run completed correctly' "$LOG_FILE" || true
printf 'Custom language-string warnings: '
grep -cF 'Invalid get_string() identifier' "$LOG_FILE" || true
printf '%s\n' 'This checker does not execute Moodle jobs or verify business outcomes.'

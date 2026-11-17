#!/usr/bin/env bash
set -euo pipefail
PHP_BIN="${PHP_BIN:-php}"
if ! command -v "$PHP_BIN" >/dev/null 2>&1; then
  printf '%s\n' 'PHP CLI not found' >&2
  exit 2
fi
"$PHP_BIN" -r '
$keys = ["memory_limit", "max_execution_time", "post_max_size", "upload_max_filesize", "opcache.enable_cli"];
echo "PHP version: ", PHP_VERSION, PHP_EOL;
echo "SAPI: ", PHP_SAPI, PHP_EOL;
foreach ($keys as $key) { echo $key, ": ", (string) ini_get($key), PHP_EOL; }
'
printf '%s\n' 'CLI settings are not proof of LiteSpeed/web SAPI settings.'

#!/usr/bin/env bash
set -euo pipefail
if [[ "$(uname -s)" != 'Darwin' ]]; then
  printf '%s\n' 'This diagnostic requires macOS.' >&2
  exit 2
fi
if ! command -v security >/dev/null 2>&1; then
  printf '%s\n' 'macOS security utility is unavailable.' >&2
  exit 2
fi
printf '%s\n' '=== macOS ==='
sw_vers -productVersion
uname -m
printf '%s\n' '=== User keychains (redact paths) ==='
security list-keychains -d user
printf '%s\n' '=== Client-auth identities (redact labels) ==='
security find-identity -v -p ssl-client || true
printf '%s\n' 'This does not validate browser login or import certificates.'

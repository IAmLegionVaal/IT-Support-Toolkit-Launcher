# Bionic local model + Gemini MCP timeout diagnostics

**Status: not resolved in the source incident.** A Node.js MCP server script was initially zero bytes. Following reconstruction the script was nonempty (2501 bytes in a subsequent check), passed `node --check`, and Bionic displayed one tool ready. A later Gemini invocation nevertheless timed out.

## Separate the layers
1. **File present?** `(Get-Item "$HOME\Bionic-Gemini-MCP\server.mjs").Length` must be nonzero.
2. **Syntax?** `node --check "$HOME\Bionic-Gemini-MCP\server.mjs"` validates grammar but not behavior.
3. **Runtime?** Check `node --version`; PowerShell execution policy may require `npm.cmd`, not `npm.ps1`.
4. **Local endpoint?** Independently check the configured LM Studio local model API, e.g. `http://localhost:1235/v1/models`.
5. **MCP handshake?** Confirm expected tool names appear in Bionic.
6. **Tool call?** Invoke harmless test and record elapsed time and error class.
7. **Cloud API?** Check outbound DNS/TLS, model availability, permissions, quota and server-timeout settings. Retry 429/5xx with bounded backoff; do not retry 401/403 blindly.
8. **Search grounding?** Prior Gemini API test returned HTTP 200 with `searchEnabled=false` and `groundingObserved=false`; do not advertise internet research until explicitly enabled and verified.

## Safe preflight
```powershell
.\scripts\Test-BionicMcpPreflight.ps1 -ServerScript "$HOME\Bionic-Gemini-MCP\server.mjs" -LocalApiUrl 'http://localhost:1235/v1/models'
```
No working Gemini server source or credentials are included because no complete source implementation has been verified. Store keys in an environment variable / secret manager, never Git.

## Acceptance
At least several successful calls, controlled timeout and offline failure behavior, no sensitive logs, and an independent grounding test. These have not all been observed.

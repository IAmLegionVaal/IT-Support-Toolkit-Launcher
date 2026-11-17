# macOS browser client certificate (mTLS) authentication

**Status: resolved in source case (November 2026).** Chrome on Apple Silicon macOS displayed `ERR_BAD_SSL_CLIENT_AUTH_CERT` for an authenticated business portal. A recommendation to install Windows/Internet Explorer in a virtual machine was not necessary.

## What was confirmed
The required provider-issued client certificate identity was absent from the user's login keychain. Importing the legitimate client certificate with its associated private key into that keychain, then approving Chrome's private key access prompt with local Mac credentials, restored sign-in. A transient timeout during investigation was not the terminal state.

## Triage
1. Validate the actual domain and error; client certificate failure differs from server certificate trust problems.
2. Run `security find-identity -v -p ssl-client` and inspect login keychain identities in Keychain Access.
3. Validate certificate expiry, intended client authentication EKU, issuer chain, matching private key, and app access policy.
4. Obtain/reimport only the correct certificate using the issuing provider's approved workflow.
5. Retry Chrome; approve only the legitimate browser use of the private key.
6. Confirm authenticated access. Do not weaken TLS verification or grant every application blanket key access.

## Read-only tool
```bash
bash scripts/inspect-client-identity.sh
```
**Sensitive output:** identity labels and paths must be redacted before sharing. Never publish certificate/private-key bundles, keychain dumps, P12 passwords or login credentials.

## Acceptance
Chrome signs in successfully without Parallels or Internet Explorer. No claims about provider-wide compatibility beyond the tested incident.

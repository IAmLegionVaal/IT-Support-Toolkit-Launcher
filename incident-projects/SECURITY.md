# Security policy for incident projects

These are defensive, anonymized support runbooks. Never commit production customer names, user identifiers, site domains, IP addresses, screenshots containing identities, password vault exports, service account secrets, API keys, GitHub PATs, private keys, PFX/P12 archives, VPN WireGuard keys, SQL connection strings, or raw Entra consent exports.

Scripts should default to read-only. Avoid changing registry, firewall, trust roots, printer drivers, account membership, cloud API consent or sync folders automatically. For change paths, require explicit opt-in with confirmation and a rollback plan.

All conclusions are evidence-labelled. A syntax-valid diagnostic script is not proof that an incident is resolved. Check provider documentation and approve changes before executing.

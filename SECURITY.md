# Security Policy

This project is a documentation and workflow scaffold. It should not contain production secrets, credentials, private keys, customer data, or sensitive raw transcripts.

## Reporting a Vulnerability

If you find sensitive information or a security issue, open a private security advisory on GitHub if available. If private advisories are not available, contact the maintainers through the repository's preferred contact channel.

Do not publish secrets or exploit details in a public issue.

## Sensitive Information Rules

- Do not commit `.env` files.
- Do not commit private keys, API keys, access tokens, or credentials.
- Redact customer data before adding public raw inputs.
- Keep public examples generic.
- If a secret is committed, rotate it immediately and remove it from history before publishing.

## Maintainer Checks

Before publishing or merging, run a local sensitive information scan and:

```sh
./scripts/lint-scaffold.sh
git diff --check
```

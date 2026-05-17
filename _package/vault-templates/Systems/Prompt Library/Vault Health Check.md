---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# Vault Health Check

Prompt for periodic vault review — find problems with frontmatter, links, and Atomic rule.

---

## Prompt

```
Please review my Obsidian vault and check for the following issues:

1. **Missing frontmatter**: Files in Knowledge/ missing type, domain, or tags
2. **Broken links**: [[wikilinks]] pointing to files that don't exist
3. **Atomic rule violations**: Notes with multiple ## sections on independent topics — suggest splitting
4. **Stale Inbox**: Notes in 00 Inbox/ that are > 7 days old and unprocessed
5. **Stuck stage**: Knowledge notes at stage/fleeting for > 14 days
6. **Empty folders**: Directories with no files

For each issue found:
- List the specific file/location
- Suggest how to fix it
- Priority: 🔴 Critical / 🟡 Medium / 🟢 Minor
```

---

## Frequency

- **Weekly**: check Inbox + stale stage/fleeting notes
- **Monthly**: check broken links + atomic violations
- **Quarterly**: check empty folders + domain taxonomy

## Related
- [[AI Capture Workflow]]
- [[_Knowledge MOC]]
- [[AGENTS]]

---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# Process Fleeting Note

Prompt to convert a raw fleeting note → a properly-structured literature note.

---

## Prompt

```
I have the following fleeting note in my Obsidian vault:

---
[PASTE NOTE CONTENT]
---

Please help me process this note into a knowledge note following my vault schema:

1. Rewrite the Summary in 1-2 clear, concise sentences (in my own voice, not copied verbatim from any source)
2. Organize content into sections: Key Concepts, Examples, Problems/Gotchas
3. Suggest an appropriate domain (options: programming, productivity, agriculture, business, health, finance, learning)
4. Suggest 2-3 wikilinks [[note]] for related notes that may already exist in the vault
5. Change stage from fleeting → literature

Output: the full note in markdown format with complete frontmatter.
```

---

## Notes

- Always review output before saving — AI may misunderstand context
- If the concept is too complex → split into multiple atomic notes

## Related
- [[AI Capture Workflow]]
- [[Vault Health Check]]

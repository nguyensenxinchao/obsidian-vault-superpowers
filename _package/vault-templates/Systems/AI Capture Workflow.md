---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# AI Capture Workflow

The process for moving insights from AI (Claude, ChatGPT, etc.) into your vault.

---

## Principle

> **AI is raw material; the vault is digested knowledge.** Don't paste blindly — rewrite in your own voice.

---

## When to capture

| Situation | Action |
|-----------|--------|
| Claude explains a new concept | Create a `Knowledge` note (stage/fleeting) |
| Claude debugs / solves a problem | Log to daily note under `## Learnings` |
| Claude creates a new workflow/process | Create a `Systems` note |
| Claude researches a long topic | Summarize → Inbox → process into literature note |
| Long conversation with many insights | Export/paste → `00 Inbox/` as fleeting, process later |

---

## Detailed Workflow

### Quick capture (during the day)

1. Claude says something valuable → **copy that passage**
2. `Ctrl+Q` (QuickAdd) → create note in `00 Inbox/`
3. Give it a descriptive name, paste raw content
4. Add minimal frontmatter: `type: knowledge`, `stage: fleeting`, `source: AI/Claude`

### Process (EOD or Sunday review)

1. Open `00 Inbox/`, review each fleeting note
2. Rewrite in your own voice — **do not copy-paste raw AI text**
3. Fill in complete frontmatter (domain, tags, source)
4. Move to `Knowledge/<domain>/` → stage = `literature`
5. Add link to the relevant MOC (`_<domain> MOC.md`)

### Promote to Evergreen (when a literature note has matured)

When a literature note has been revisited ≥ 2 times and the insight still holds:

1. Run the **Evergreen Checklist** (see [[AGENTS]] §10)
2. Rename the file → **assertion title** (a declarative statement, not a keyword)
3. Ensure ≥ 2 `[[wikilinks]]` outgoing
4. Change tag `stage/literature` → `stage/permanent`
5. Update the MOC — this note is now Evergreen, link to it confidently from anywhere

> Use the prompt [[Promote to Evergreen]] to have AI handle this step.

---

## Template for notes from AI

When creating a note from an AI conversation:

```yaml
---
type: knowledge
domain: <domain>
tags:
  - type/knowledge
  - stage/fleeting
  - domain/<domain>
created: <today>
source: AI/Claude — <topic>
---

# <title>

## Summary
> [Rewrite in your own voice — do not paste raw AI output]

## Key Points
- 
```

---

## Anti-patterns

- ❌ Pasting raw AI text blocks without rewriting → note loses meaning and context
- ❌ Creating notes named `Untitled` or `Claude response`
- ❌ Not filling `source:` → loses traceability
- ❌ Leaving fleeting notes in Inbox > 1 week without processing

---

## Related

- [[AGENTS]] — vault conventions overview
- [[Tagging]] — tag taxonomy
- [[_Knowledge MOC]] — knowledge entry point
- [[Systems/Prompt Library]] — tested prompts

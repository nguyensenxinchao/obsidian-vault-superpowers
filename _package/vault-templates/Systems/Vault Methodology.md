---
type: system
status: status/active
tags:
  - type/system
  - meta/taxonomy
created: 2026-05-18
---

# Vault Methodology

A guide to using the skills system in this vault. Read this to understand which skill to use and why.

> Inspired by: [Superpowers](https://github.com/obra/superpowers) — adapted for PKM/Obsidian instead of coding.

---

## Core Principles

**1. Invoke a skill BEFORE doing anything.**
When receiving a request, immediately check if any skill applies. Even a 1% chance it's applicable → check the skill. Don't rationalize skipping it.

**2. Priority hierarchy:**
```
User's explicit instructions  (highest)
        ↓
Vault skills (AGENTS.md + .claude/commands/)
        ↓
Default AI behavior           (lowest)
```

**3. Verification gate — non-negotiable.**
Never claim "done" without verifying with evidence:
- File created? → Re-read the file
- MOC updated? → Check the MOC file
- Links not broken? → Verify target file exists
Phrases like "should work", "probably done", "I think" = not yet verified.

**4. One question at a time.**
Never ask multiple questions at once. Ask → wait → ask again.

**5. YAGNI for PKM.**
Don't create notes, MOCs, or folders "just in case". Only create when there's real content.

---

## Skill Map

### When to use which skill

```
New topic / idea
    ↓
Topic still vague? ────── YES ──→ /brainstorm
    │
    NO
    ↓
Needs complex planning? ── YES ──→ /plan
    │
    NO
    ↓
Insight clear, atomic? ─── YES ──→ /evergreen
    │
    NO
    ↓
Clear source, basic grasp? ─ YES ──→ /note
    │
    NO
    ↓
Raw content, no time right now? ──→ /capture

Tracking today: tasks/wins/problems ──→ /daily
Clear Inbox, promote notes ─────────→ /process
End of week: vault maintenance ──────→ /weekly-review
Vault errors, broken links ──────────→ /debug-vault
Create a new command ────────────────→ /new-skill
```

---

## All Skills

| Skill | Trigger | Terminal State |
|-------|---------|----------------|
| `/brainstorm` | Broad topic, unclear what the insight is | Spec doc saved in `Systems/Specs/` + user chooses /note or /evergreen |
| `/plan` | Open questions needing systematic research | Plan doc saved in `Systems/Specs/` + ask whether to execute now |
| `/note` | Clear source, partially-understood insight | Literature note at `Knowledge/<domain>/` |
| `/evergreen` | Clear, atomic, assertion-ready insight | Permanent note at `Knowledge/<domain>/`, MOC updated |
| `/capture` | Raw content, quick Inbox capture | Fleeting note at `00 Inbox/` |
| `/daily` | Task/event/win/problem for today | Content added to `Daily/<today>.md` |
| `/process` | Clear Inbox, promote fleeting notes | Inbox cleared, notes promoted or deleted |
| `/weekly-review` | End of week, vault maintenance | Health report, MOCs updated, Inbox cleared |
| `/debug-vault` | Vault errors, unexpected behavior | Root cause identified, fix verified |
| `/new-skill` | Want to add a new command | Skill file + test case + AGENTS.md updated |

---

## Common Pipelines

### Pipeline: Exploring a new topic
```
/brainstorm [topic]
    → Spec doc saved at Systems/Specs/
    → For each insight: /evergreen or /note
    → If more research needed: /plan
    → Track related tasks: /daily
```

### Pipeline: Learning from a source (article, video, book)
```
/capture [paste raw content]
    → Fleeting note in Inbox
    → /process (when ready)
    → /note (literature) or /evergreen directly
```

### Pipeline: Insight that pops into your head
```
/evergreen [assertion immediately]
    → Checklist → assertion title → permanent note created
```

### Pipeline: End of week
```
/weekly-review
    → Inbox audit → stale notes → MOC health → vault health
    → /process each waiting note
    → Create daily note with summary
```

---

## Anti-Rationalization Rules

If you (AI) are thinking any of the following → that's rationalization, stop and check for a skill:

- *"This question is too simple to need a skill"*
- *"I need more context before invoking the skill"*
- *"The user just wants a quick answer"*
- *"This skill doesn't quite fit"*
- *"I already know what to do"*
- *"The skill will slow things down"*

**If a skill exists and could plausibly apply → invoke it.**

---

## Skill Artifact Folder Structure

```
Systems/
├── Vault Methodology.md    ← this file
├── AI Capture Workflow.md
├── Specs/                  ← output of /brainstorm and /plan
│   └── YYYY-MM-DD-<topic>-spec.md
│   └── YYYY-MM-DD-<topic>-plan.md
└── Prompt Library/         ← manual prompts (legacy)
.claude/
└── commands/               ← skill files
    ├── brainstorm.md
    ├── plan.md
    ├── note.md
    ├── evergreen.md
    ├── capture.md
    ├── daily.md
    ├── process.md
    ├── weekly-review.md
    ├── debug-vault.md
    └── new-skill.md
```

---

## Related

- [[AGENTS]] — vault conventions overview, §7 slash commands
- [[AI Capture Workflow]] — AI → vault workflow
- [[Evergreen Notes]] — Evergreen notes philosophy
- [[_Knowledge MOC]] — knowledge entry point

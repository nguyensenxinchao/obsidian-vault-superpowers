name: weekly-review
description: Use when doing end-of-week vault maintenance — process inbox, promote stale notes, update MOCs, check vault health. Run every Sunday or at end of sprint.
triggers: "end of week review", "vault review", "Sunday review", "clean up vault", end of week, end of sprint
terminal-state: Inbox cleared, stale notes processed, MOCs updated, vault health report generated. All actions verified.

---

## Checklist — Complete in this exact order

**[ ] 1. Inbox audit**
Scan `00 Inbox/` (excluding README.md):
- List all notes: name | created date | 1-sentence summary
- Flag: notes > 7 days old → prioritize processing
- Ask user if they want to `/process` each one or skip this week

**[ ] 2. Stale fleeting notes**
Scan `Knowledge/` with `stage/fleeting`:
- List: name | created date | domain
- Flag: notes > 14 days → need a decision: promote or delete
- For each note: suggest action, ask for confirmation

**[ ] 3. Literature notes ready to promote**
Scan `Knowledge/` with `stage/literature`:
- Find notes that are > 14 days old AND have ≥ 2 outgoing links
- Suggest: "This note looks ready for Evergreen. Want to run `/evergreen`?"
- Don't self-promote — ask confirmation for each one

**[ ] 4. MOC health check**
Check each domain MOC in `Knowledge/_meta/`:
- Are there new Evergreen notes not yet added to the MOC?
- Are there broken links in the MOC?
- Does any MOC need to be created (domain has > 5 notes but no MOC)?

**[ ] 5. Vault health scan**
Run these checks:
- [ ] Files missing `type:` frontmatter → list them
- [ ] Files with `type: knowledge` but missing `domain:` → list them
- [ ] Files with empty `tags:` → list them
- [ ] Broken wikilinks (linking to non-existent files) → list them
- [ ] Empty folders → list them

**[ ] 6. Self-review report**
Before showing user, compile the report:
- Total issues found by category
- Actions already taken
- Actions that need user decisions

**[ ] 7. Verification gate**
After applying fixes:
- Verify each fix is correct (re-read files, check MOCs)
- Confirm Inbox has shrunk (if notes were processed)
- DO NOT claim "vault is clean" without verifying actual state

**[ ] 8. Generate weekly report**
Create/update a section in today's daily note:
```markdown
## Weekly Vault Review — <date>
- Inbox processed: [n] notes
- Promoted to literature: [n]
- Promoted to Evergreen: [n]
- Deleted: [n]
- Issues found: [list]
- Issues fixed: [list]
- Issues deferred: [list]
```

**[ ] 9. Terminal state**
Ask: *"Anything you want to `/brainstorm` or `/plan` for next week?"*

---

## Anti-Patterns

- ❌ Processing all notes without asking the user about each one
- ❌ Deleting a note without confirmation
- ❌ Promoting to Evergreen without running the Evergreen Checklist
- ❌ Reporting "vault is clean" without verifying
- ❌ Skipping the MOC health check

## Key Principles

- **Systematic, not ad-hoc**: follow the checklist in order
- **User decides**: AI suggests, user decides — especially for delete and promote
- **Evidence-based**: report real numbers, not estimates

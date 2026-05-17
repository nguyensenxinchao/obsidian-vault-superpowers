name: process
description: Clear the Inbox and promote fleeting notes to literature or Evergreen. Use during EOD review or Sunday review. Systematic — one note at a time.
triggers: "clear inbox", "process notes", EOD review, Sunday review, "what's waiting to be processed"
terminal-state: All notes have been handled (promoted, deleted, or deferred). Inbox is clear or each remaining note has a documented reason for staying.

---

**[ROUTING CHECK — Do this first]**

If `$ARGUMENTS` contains a specific note name → Jump directly to checklist step 3 with that note.
If no argument → Run the full scan from step 1.

---

## Checklist — Complete in this exact order

**[ ] 1. Scan vault**
Read and list:
- Files in `00 Inbox/` (excluding README.md)
- Files in `Knowledge/` with tag `stage/fleeting`

Output format:
```
1. [note name] | created: YYYY-MM-DD | [1-sentence summary]
2. ...
```
Sort: oldest first (highest priority to process).

Add a quick health check:
- [ ] Any note in Inbox > 7 days?
- [ ] Any fleeting note in Knowledge/ > 14 days?

**[ ] 2. Ask user**
*"There are [N] notes waiting. Which note do you want to process? (type a number, or 'all' to go through them one by one)"*
Stop, wait for user to choose.

**[ ] 3. For each selected note:**

**[ ] 3a. Read the full content**

**[ ] 3b. Assess and suggest action:**
- Note is ready to promote to `stage/literature`? → suggest `/note`
- Note is ready for Evergreen right now? → suggest `/evergreen`
- Note has no more value? → suggest delete
- Note needs more research? → suggest `/brainstorm`

**[ ] 3c. Ask user to confirm action before proceeding**

**[ ] 3d. Execute the chosen action:**
- If promoting: rewrite in your own voice, fill frontmatter, move to correct folder
- If Evergreen: run the full `/evergreen` flow
- If deleting: delete file, report reason
- If deferring: update created date, write reason for deferral in the note

**[ ] 4. Verification gate after each note**
- Confirm note was handled correctly (file in correct location, correct frontmatter)
- If promoted: confirm MOC was updated
- If deleted: confirm file is gone
- Report result before moving to the next note

**[ ] 5. Continue or wrap up**
After each note, ask: *"Continue with the next note?"*

When all done → report summary:
```
Processed: [N] notes
- Promoted to literature: [n]
- Promoted to Evergreen: [n]
- Deleted: [n]
- Deferred: [n]
Inbox remaining: [n] notes
```

---

## Anti-Patterns

- ❌ Processing multiple notes at once without user confirmation for each
- ❌ Promoting a note without rewriting in your own voice
- ❌ Deleting a note without asking the user
- ❌ Skipping verification after each note
- ❌ Claiming "inbox is clear" without actually verifying

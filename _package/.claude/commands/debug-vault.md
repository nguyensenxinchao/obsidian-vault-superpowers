name: debug-vault
description: Use when vault has quality problems — broken links, missing frontmatter, notes violating conventions, or Dataview queries returning wrong results. Systematic investigation BEFORE any fixes.
triggers: "something is wrong in vault", broken links, Dataview query returning wrong results, "why isn't note X showing in MOC", vault health check, "find errors in vault"
terminal-state: Root cause identified, fixes applied and verified. Clear report: what was the problem, what caused it, what was fixed.

---

**CORE PRINCIPLE: DO NOT FIX ANYTHING BEFORE FINDING THE ROOT CAUSE.**

If something has been fixed 3 times and is still wrong → this is a structural problem. Step back and re-examine the architecture instead of continuing to patch.

---

## Checklist — Complete in this exact order

**[ ] 1. Reproduce the problem**
Understand the exact symptom:
- What specifically is the problem? (broken link? wrong dataview? missing note?)
- Where does it occur (which file, which section)?
- Is it reproducible?

**[ ] 2. Read error/evidence**
- Read the failing file
- Read the Dataview query (if applicable)
- Read frontmatter of related notes
- DO NOT guess — read actual files

**[ ] 3. Pattern analysis — find what's different**
- Find a similar note/link that IS working
- Compare failing note to working note: what differs?
- Check: frontmatter fields, tag format, file path, wikilink syntax

**[ ] 4. Identify root cause**
State the hypothesis clearly:
*"I believe the problem is [X] because of evidence [Y]."*

If you can't state a clear hypothesis → go back to step 2 and read more.

**[ ] 5. Test the hypothesis**
Change ONE variable only to test. Don't fix multiple things at once.

**[ ] 6. Implement fix**
Only after the hypothesis is confirmed:
- Fix the root cause, not the symptom
- Apply the fix consistently (if the problem appears in multiple files)

**[ ] 7. Verification gate**
- Verify the original problem has been fixed
- Verify the fix didn't introduce new problems
- If using Dataview: re-read query output to confirm
- Report: *"Root cause: [X]. Fix: [Y]. Verified by: [Z]."*
- DO NOT claim "done" without verifying

**[ ] 8. Prevention note**
If the problem can recur → suggest adding it to AGENTS.md as an anti-pattern.

---

## Common Vault Bugs & Root Causes

| Symptom | Common root cause |
|---------|-------------------|
| Note not showing in Dataview | Wrong `type:`, wrong tag format, wrong folder path in query |
| Wikilink broken | File was renamed/moved, filename differs from link text |
| Note not showing in MOC | Link not added to MOC, or Dataview filter is wrong |
| stage/permanent but filename is still a keyword | File not renamed when promoted to Evergreen |
| Frontmatter parse error | Wrong indentation, special characters in value |

---

## Anti-Patterns

- ❌ Fixing before finding root cause
- ❌ "Trying" multiple fixes at once — no way to know which one worked
- ❌ Claiming "fixed" without verifying
- ❌ Fixing the symptom instead of the cause
- ❌ After 3 failed fixes, continuing to fix instead of re-examining the problem

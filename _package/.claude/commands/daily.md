name: daily
description: Add content to today's daily note — tasks, learnings, wins, problems, ideas. Use for daily tracking, not for long-term knowledge storage.
triggers: new task, just completed something, just ran into a problem, end of day recap, "add to daily"
terminal-state: Content added to the correct section of today's daily note. If it's a knowledge/insight → ask if the user also wants /note or /evergreen.

---

**[ROUTING CHECK — Do this first]**

Read `$ARGUMENTS`:
- **Long-term concept/insight** ("JWT is stateless so tokens can't be revoked") → *"This is knowledge worth keeping long-term, not just in daily. Want me to do both: add to daily AND create a `/note` or `/evergreen`?"* → Stop, wait for confirmation.
- **Task/event/win/problem for today** → Continue.

---

## Checklist — Complete in this exact order

**[ ] 1. Read today's daily note**
- Find `Daily/<today>.md`
- If it doesn't exist → create from `Templates/Daily.md` with the correct date

**[ ] 2. Route content to the correct section**

| Type | Section | Format |
|------|---------|--------|
| Task to do | `## Tasks` | `- [ ] content` |
| Thing learned | `## Learnings` | text or bullet |
| Idea | `## Ideas` | bullet |
| Problem encountered | `## Problems` | description + context |
| Good outcome | `## Wins` | bullet |
| General notes | `## Notes` | free-form |

If the type is unclear → ask the user.

**[ ] 3. Add content — do not overwrite**
Append to the correct section, keep existing content intact.

**[ ] 4. Verification gate**
- Re-read the daily note after adding, confirm content is in the correct section
- Report: *"Added to `Daily/<date>.md` section `## <Section>`."*
- DO NOT claim "done" without verifying

**[ ] 5. Terminal state**
If the content is an insight/learning:
→ *"Is this worth keeping long-term? If so, use `/note` or `/evergreen`."*

If this is the last `/daily` call of the day:
→ *"Want to fill out the EOD Review too?"*

---

## Anti-Patterns

- ❌ Overwriting existing content in the daily note
- ❌ Using daily to store long-term knowledge (that's what /note and /evergreen are for)
- ❌ Creating a daily note without using the template
- ❌ Claiming "done" without verifying content is in the correct section

name: capture
description: Quickly capture raw content into 00 Inbox/ for later processing. Use when there's no time to process immediately or the content isn't ready to be rewritten.
triggers: pasting raw content, quick notes, no time to process now, after a long AI conversation and want to save quickly
terminal-state: Fleeting note exists in 00 Inbox/. Remind user to use /process to promote later.

---

**[ROUTING CHECK — Do this first]**

Read `$ARGUMENTS`:
- **Clear insight that can be written as an assertion now** → *"This content is clear enough for a proper note. Suggest `/note` (literature) or `/evergreen` instead of Inbox — which do you prefer?"* → Stop, wait.
- **Broad topic you want to think about more** → *"This looks like a topic that needs exploration. Suggest `/brainstorm` — or capture raw first then brainstorm later?"* → Stop, wait.
- **Raw content, quick notes, unprocessed** → Continue.

---

## Checklist — Complete in this exact order

**[ ] 1. Check Inbox**
Read `00 Inbox/` to check if a related note is already waiting. If so → ask: merge into that one or create new?

**[ ] 2. Create note in 00 Inbox/**
- Name: describes the content (NOT "Untitled" or "Claude response")
- Minimal frontmatter:
  ```yaml
  type: knowledge
  domain: <determine automatically>
  tags:
    - type/knowledge
    - stage/fleeting
    - domain/<domain>
  created: <today>
  source: <if known>
  ```
- Summary 1–2 sentences in your own voice
- Keep raw content intact, organized into appropriate sections
- Suggest 2–3 potential `[[wikilinks]]` (don't add to file yet)

**[ ] 3. Self-review**
- [ ] Does the filename accurately describe the content?
- [ ] Is the domain reasonable?
- [ ] Is there any sensitive information being captured?

**[ ] 4. Verification gate**
- Re-read the created file, confirm frontmatter and content are correct
- Report: *"Captured to `00 Inbox/<filename>.md` (stage/fleeting)."*
- DO NOT claim "done" without verifying

**[ ] 5. Terminal state**
Remind: *"This note is waiting in Inbox. Use `/process` when ready to promote to literature or Evergreen."*

---

## Anti-Patterns

- ❌ Naming the file "Untitled", "Note 1", or "Claude response"
- ❌ Capturing directly into Knowledge/ (must go through Inbox)
- ❌ Skipping the domain in frontmatter (needed for /process to have context)
- ❌ Claiming "done" without verifying the file exists

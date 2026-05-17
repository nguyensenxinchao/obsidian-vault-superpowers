name: note
description: Create a structured knowledge note from content you've already understood. Use when you have a clear source or a partially-digested insight that isn't yet ready for Evergreen.
triggers: "just read an article about X", "I understand that X but not sure", after /brainstorm when an insight needs more research
terminal-state: Note created at Knowledge/<domain>/ with stage/literature. Remind user: use /evergreen when the note has been revisited and the insight has matured.

---

**[ROUTING CHECK — Do this first]**

Read `$ARGUMENTS`:
- **Broad/vague topic** ("CORS", "React") → *"This topic isn't specific enough. Suggest `/brainstorm` to explore first — agree?"* → Stop, wait.
- **Clear, atomic assertion** ("JWT is stateless so tokens can't be revoked") → *"This insight is already clear enough for Evergreen. Suggest `/evergreen` — agree?"* → Stop, wait.
- **Raw pasted content** → *"This content hasn't been processed yet. Suggest `/capture` to Inbox first — or should I structure it directly as a literature note?"* → Stop, wait.
- **Topic with clear source, understood at a basic level** → Continue.

---

## Checklist — Complete in this exact order

**[ ] 1. Check vault context**
- Find existing notes related to the topic
- If a very similar note already exists → ask: merge into that one or create new?

**[ ] 2. Determine domain and stage**
- Domain: programming / productivity / agriculture / business / health / finance / learning
- Stage: `stage/literature` (default) or `stage/fleeting` if context is still incomplete

**[ ] 3. Write the note**
- Filename: Title Case describing the subject (NOT an assertion — that's what `/evergreen` is for)
- Complete frontmatter per AGENTS.md §2 schema
- Summary: 1–2 sentences in **your own voice**, not the source's language
- Fill all sections: Key Concepts, Examples, Problems/Gotchas, Related, References
- Add ≥ 2 `[[wikilinks]]` outgoing to existing notes in the vault

**[ ] 4. Self-review**
Before saving, check:
- [ ] Is the Summary in your own voice (not copied from source)?
- [ ] Is the domain correct?
- [ ] Are there at least 2 [[links]]?
- [ ] Is the frontmatter complete?

**[ ] 5. Update MOC**
Add a link to `Knowledge/_meta/_<domain> MOC.md`.

**[ ] 6. Verification gate**
- Re-read the created file: correct frontmatter, content present, links working
- Confirm MOC was updated
- Report: *"Created `[[<note name>]]` at `Knowledge/<domain>/`. MOC updated."*
- DO NOT claim "done" without verifying

**[ ] 7. Terminal state**
Remind user: *"This note is at stage/literature. When you revisit it and the insight has matured, use `/evergreen <note name>` to promote it to Evergreen."*

---

## Anti-Patterns

- ❌ Using an assertion as the filename → that's what `/evergreen` is for
- ❌ Copying verbatim from source into Summary
- ❌ Creating a note without checking what's already in the vault
- ❌ Skipping the MOC update step
- ❌ Claiming "done" without verifying the file and MOC

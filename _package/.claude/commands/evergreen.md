name: evergreen
description: Create or promote a note to Evergreen (stage/permanent). Use when an insight is clear, atomic, and can be formulated as an assertion title. This is a permanent record — quality must be high.
triggers: insight is clear and atomic, after /brainstorm when insight needs no further research, after /note when the note has been revisited ≥ 1 time
terminal-state: Evergreen note exists at Knowledge/<domain>/<assertion>.md with stage/permanent, MOC updated. Vault graph is richer than before.

---

**[ROUTING CHECK — Do this first]**

Read `$ARGUMENTS`:
- **Keyword/topic** ("CORS", "authentication") → *"This is a topic, not an assertion. A single topic can become many different Evergreens. Suggest `/brainstorm` to explore specific assertions — agree?"* → Stop, wait.
- **Long content with multiple concepts** → *"I see at least [X] and [Y] as 2 separate insights. This violates the Atomic rule. Want me to split this into [N] Evergreen notes?"* → Stop, wait for confirmation.
- **Raw content, not yet rewritten** → *"This content hasn't been digested in your own voice. Suggest `/note` (literature) to process it first — agree?"* → Stop, wait.
- **Clear, atomic assertion, already well-understood** → Continue.

---

## Checklist — Complete in this exact order

**[ ] 1. If input is an existing note name — read that note**
- Read current content
- Check: has it been revisited, what is the current stage

**[ ] 2. Evergreen Checklist** (AGENTS.md §10)
Check each item, report pass/fail:
- [ ] Atomic: only 1 single concept?
- [ ] Assertion: can it be formulated as a declarative statement?
- [ ] Own voice: no trace of source or AI language?
- [ ] Linkable: can it have ≥ 2 outgoing [[links]]?
- [ ] Multi-context: can it be linked from ≥ 2 different domains?

If any item fails → report specifically, suggest fix, ask for confirmation before continuing.

**[ ] 3. Propose assertion title — 3 candidates**
Write 3 versions of the title as declarative assertions. Ask user to choose (or write their own). Stop, wait for confirmation.

**[ ] 4. Create/rewrite the note** (after user confirms title)
- Path: `Knowledge/<domain>/<assertion title>.md`
- Frontmatter: type/knowledge, stage/permanent, correct domain, correct tags per schema
- Summary: 1 paragraph, in your own voice, concise
- Sections: Key Concepts, Examples, Problems/Gotchas, Related (≥ 2 links), References
- If promoting from an old note: delete the old note after creating the new one

**[ ] 5. Self-review**
Before reporting done:
- [ ] Is the title truly an assertion (can it be argued against)?
- [ ] Can the note stand independently?
- [ ] Are outgoing links ≥ 2 and pointing to files that actually exist?
- [ ] Is the Summary in your own voice, not AI language?

**[ ] 6. Update MOC**
Add a link to `Knowledge/_meta/_<domain> MOC.md` with a short annotation.

**[ ] 7. Verification gate**
- Re-read the created file to confirm correct content
- Verify outgoing links point to files that actually exist
- Confirm MOC was updated
- Report: *"Evergreen note `[[<assertion title>]]` created. [N] outgoing links. MOC updated."*
- DO NOT claim "done" without verifying everything

---

## Anti-Patterns

- ❌ Promoting when the note has never been revisited after writing
- ❌ Title is still a keyword after calling it an Evergreen
- ❌ Skipping the Atomic check — if there are 2 concepts → must split
- ❌ Links pointing to files that don't exist
- ❌ Claiming "done" without verifying the file and MOC

## Key Principles

- **Quality > quantity**: 10 truly good Evergreens beat 50 soulless notes
- **Title is an assertion**: something you can argue against
- **Evergreen is a living document**: it will be updated, not written once and abandoned

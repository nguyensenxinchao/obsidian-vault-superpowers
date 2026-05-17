name: new-skill
description: Use when creating a new vault slash command. Follows TDD methodology — define the problem and test case BEFORE writing the skill. No skill without a failing test first.
triggers: "create new command", "add slash command", "want a / for doing X", "write new skill"
terminal-state: Skill file exists at .claude/commands/<name>.md, tested with at least 1 test case, AGENTS.md updated.

---

**PRINCIPLE: Every skill needs a failing test FIRST. No exceptions, not even for "simple skills".**

TDD for skill creation: RED (define test) → GREEN (write minimal skill) → REFACTOR (close loopholes).

---

## Checklist — Complete in this exact order

**[ ] 1. Define the problem**
Ask user: *"What specific problem does this skill solve? What do you find yourself telling AI to do that you wish it just knew?"*
Wait for answer. State the problem clearly.

**[ ] 2. Check existing skills**
Read all files in `.claude/commands/`:
- Does this skill overlap with an existing skill?
- Can an existing skill be enhanced instead of creating a new one?
If so → suggest enhancing instead of creating new.

**[ ] 3. Write the test case FIRST (RED)**
Describe one specific successful interaction:
```
Test: User types /[skill-name] [input]
Expected behavior:
1. AI does X
2. AI asks Y
3. AI creates file Z at path W
4. AI verifies by doing A
5. AI reports result B
```
Ask user: is this test case correct?

**[ ] 4. Write minimal skill (GREEN)**
Write only enough to pass the test case. Required format:
```markdown
name: <skill-name>
description: Use when <triggering condition — NOT workflow summary>.
triggers: <explicit trigger phrases>
terminal-state: <always ends with what>

---

## Checklist — Complete in this exact order

[ROUTING CHECK if needed]

**[ ] 1. ...**
**[ ] 2. ...**
...
**[ ] N. Verification gate**
...
**[ ] N+1. Terminal state**
...

---

## Anti-Patterns
- ❌ ...

## Key Principles
- ...
```

**Important about `description:`**
- Must start with "Use when..."
- Describes TRIGGERING CONDITIONS only, not workflow
- Claude may only read the description without reading the full skill — it must be sufficient to trigger correctly

**[ ] 5. Refactor — close loopholes (REFACTOR)**
Re-read the skill and look for:
- [ ] Any place where AI could "cheat" (skip a step)?
- [ ] Any ambiguity that could be interpreted in multiple ways?
- [ ] Does the verification gate actually verify what needs to be verified?
- [ ] Do the anti-patterns cover real failure modes?

Fix inline.

**[ ] 6. Save skill file**
Create `.claude/commands/<name>.md` with the written content.

**[ ] 7. Manual test**
Run the test case from step 3: type `/[skill-name] [input from test]`
Verify output matches expected behavior.

**[ ] 8. Update AGENTS.md**
Add the new skill to the slash commands table in AGENTS.md §7.

**[ ] 9. Verification gate**
- Confirm file exists at `.claude/commands/<name>.md`
- Confirm AGENTS.md was updated
- Confirm skill passed the test case
- DO NOT claim "done" without testing

---

## Anti-Patterns

- ❌ Writing the skill before writing the test case
- ❌ Description describes workflow instead of triggering conditions
- ❌ Skill has no verification gate
- ❌ Skill has no clear terminal state
- ❌ Creating a skill for a one-off task (skills must be reusable)
- ❌ Duplicating an existing skill — enhance instead of creating new

## Key Principles

- **TDD is non-negotiable**: test first, skill second
- **Minimal**: skill does exactly one thing clearly
- **Description = trigger, not summary**
- **Reusable**: if only used once → no need for a skill

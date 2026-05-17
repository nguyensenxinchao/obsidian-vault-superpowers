name: plan
description: Use when a topic requires structured research across multiple sessions, or when brainstorm output has open questions needing systematic investigation. Creates a written research plan saved to Systems/Specs/.
triggers: after /brainstorm when there are complex open questions, topic needs research from multiple sources, want to tackle a new domain systematically
terminal-state: Research plan exists at Systems/Specs/YYYY-MM-DD-<topic>-plan.md. Always ends by asking the user whether to execute immediately or defer.

---

## Checklist — Complete in this exact order

**[ ] 1. Load context**
- Read related spec doc if one already exists from `/brainstorm` (search in `Systems/Specs/`)
- Read related notes in vault
- Report: *"I see current context: [X]. Plan will build on top of that."*

**[ ] 2. Ask clarifying questions about scope — one at a time**
Focus on:
- Depth: how far do you want to go? (overview vs. deep expertise)
- Time: any deadlines or milestones?
- Output: what notes will this plan produce? (literature? evergreen? project?)

**[ ] 3. Propose 2–3 research approaches**
With trade-offs. Lead with recommendation. Examples:
- Breadth-first: survey many sources, capture overview first
- Depth-first: dig deep into one main source, branch out from there
- Problem-first: start from a specific pain point, research backward

**[ ] 4. Write the research plan** (after user approves approach)

Plan structure:
```markdown
# Research Plan: <topic>
## Goal
[Specific outcome: what will I have when this plan is done?]

## Scope
[In scope / Out of scope]

## Research Steps
### Step 1: [step name] — [estimated time]
- Specific source/action
- Output: [what note will be created]
- Done when: [completion criteria for this step]

### Step 2: ...

## Knowledge Notes to Create
- [ ] [potential note name] (stage/literature)
- [ ] [potential assertion] → Evergreen

## Open Questions (from brainstorm)
- ?
```

**[ ] 5. Self-review plan**
Before showing the user:
- [ ] Does each step have a specific output?
- [ ] Are any steps "TBD" or vague? → Fix now
- [ ] Is the scope realistic? (not too broad for one plan)
- [ ] Are done criteria measurable?

**[ ] 6. Save plan**
Create file `Systems/Specs/YYYY-MM-DD-<topic>-plan.md` with plan content.

**[ ] 7. Verification gate**
- Re-read the saved file, confirm content is correct
- Report: *"Plan saved at `Systems/Specs/<filename>.md`"*
- DO NOT claim "done" without verifying the file exists

**[ ] 8. Terminal state**
Ask user: *"Want to start executing Step 1 right now? (I'll use /note or /evergreen after each step)"*

---

## Anti-Patterns

- ❌ Plan with no specific output for each step
- ❌ Steps that say "research X" without specifying what note to create from that research
- ❌ Scope too broad (1 plan = 1 outcome, not 10 outcomes)
- ❌ Not saving the plan to a file — must produce an artifact
- ❌ Starting to execute before saving the plan first

## Key Principles

- **Plan first, execute later**: never jump straight into research
- **Output-oriented**: every step must create a specific note
- **YAGNI**: only plan what's truly needed, don't plan "just in case"

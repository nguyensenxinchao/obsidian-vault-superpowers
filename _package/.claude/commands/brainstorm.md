name: brainstorm
description: Use BEFORE any note-taking session when the topic is still vague — explore intent, define insights, choose a capture strategy. Auto-trigger when the user says "I want to learn about X" or the topic spans more than one concept.
triggers: broad topic, exploratory thinking, don't know what the note should be, "I want to learn about X"
terminal-state: Always ends with (1) a spec doc saved to Systems/Specs/ AND (2) the user choosing /note, /evergreen, or /plan to continue.

---

**[ROUTING CHECK — Do this first]**

Read `$ARGUMENTS` and check:
- If it's already a **specific assertion** ("JWT has no built-in revocation") → *"This insight is already clear. Suggest `/evergreen` instead of brainstorm — agree?"* → Stop, wait.
- If it's a **task/action** ("set up CORS middleware") → *"This is a task. Suggest `/daily` — or do you want to understand the topic more deeply?"* → Stop, wait.
- If it's a **broad topic that needs exploration** → Continue with the checklist below.

---

## Checklist — Complete in this exact order

**[ ] 1. Explore context**
Before asking anything, read the vault to understand current context:
- Search for notes related to the topic (grep name, domain)
- Read the relevant MOC if one exists
- Report briefly: *"I see the vault already has: [X, Y]. I'll build on top of that."*

**[ ] 2. Ask clarifying questions — one at a time**
Ask one question at a time, wait for an answer before asking the next. Prefer multiple-choice questions. Focus on:
- Purpose: *Why* do you want to understand this topic?
- Scope: How deep do you want to go?
- Output: What will you use this knowledge for?

**[ ] 3. Propose 2–3 angles to explore**
After understanding scope, propose 2–3 different exploration directions with trade-offs. Lead with your recommendation and explain why.

**[ ] 4. Explore (with user approval)**
After the user picks a direction:
- Ask 5–7 exploratory questions (divergent thinking)
- Still: **one question per message**, wait for answers

**[ ] 5. Synthesize insights**
After exploration, synthesize:
- 3–5 insights as **assertions** (statements that can be true or false)
- 1–2 open questions that still need research
- 1–2 next action items

**[ ] 6. Self-review before showing the user**
Quick output check:
- [ ] Is each insight truly an assertion (not a keyword)?
- [ ] Do any insights overlap (violating Atomic rule)?
- [ ] Is any insight too vague?
Fix inline before continuing.

**[ ] 7. Save spec doc**
Create `Systems/Specs/YYYY-MM-DD-<topic>-spec.md` with this content:
```yaml
---
type: system
status: status/active
tags: [type/system, meta/spec]
created: <today>
topic: <topic>
---
# Brainstorm Spec: <topic>
## Context (from vault)
## Intent & Scope
## Insights (assertions)
## Open Questions
## Next Steps
```

**[ ] 8. Verification gate**
After creating the file:
- Re-read the file to confirm content is correct
- Report: *"Spec saved at `Systems/Specs/<filename>.md`"*
- DO NOT claim "done" without verifying the file exists with the correct content

**[ ] 9. Capture decision — terminal state**
For each insight in the spec, ask the user:
- Clear, atomic insight → `/evergreen <assertion>`
- Needs more research → `/note <topic>` (literature)
- Needs complex planning → `/plan <topic>`
- Uncertain → leave in spec, review later

---

## Anti-Patterns

- ❌ Asking multiple questions at once → one question per message only
- ❌ Ignoring vault context → always read vault first
- ❌ Not saving a spec doc → output must be a file, not just chat
- ❌ Claiming "done" without verifying the file exists
- ❌ Insights are keywords, not assertions

## Key Principles

- **YAGNI for PKM**: don't explore what you don't need right now
- **Build on existing**: what's already in the vault → don't duplicate, link instead
- **Assertion-first**: every insight must be formulatable as an assertion
- **One question at a time**: non-negotiable

---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# Promote to Evergreen

Prompt to have AI convert a `stage/literature` note → Evergreen (`stage/permanent`).

---

## Prompt

```
I want to promote the following note to Evergreen (stage/permanent) in my Obsidian vault.

Current note:
---
[PASTE NOTE CONTENT + FRONTMATTER]
---

Please run the Evergreen Checklist and complete the following steps:

**Checklist** (check each item, report pass/fail):
- [ ] Atomic: does the note cover only 1 single concept?
- [ ] Assertion title: is the filename a declarative statement (not a keyword)?
- [ ] Own voice: is the content written in my own voice (not the source's language)?
- [ ] Links ≥ 2: does it have at least 2 [[wikilinks]] outgoing?
- [ ] Multi-context: can this note be linked from ≥ 2 different domains?

**If the note doesn't pass the checklist:**
1. Report which items failed
2. If it violates Atomic → suggest how to split into multiple notes
3. If missing links → suggest specific [[links]] that could be added

**If the note passes (or after fixing):**
1. Suggest 2-3 assertion titles (declarative statements containing the specific insight)
2. Rewrite the Summary if it still sounds like the source or AI
3. Output: complete note with frontmatter updated to stage/permanent + new filename

Vault conventions: see [[AGENTS]] §10 and [[Evergreen Notes]].
```

---

## Example of good output

**Input title**: `"Optimal Temperature for Raising Mealworms"` (keyword)

**Output title options**:
1. `"Mealworms develop optimally at 30°C ±2°C"`
2. `"Mealworms require temperatures above 25°C to thrive, optimal at 30°C"`
3. `"Below 25°C mealworm larvae develop slowly — insulating plastic wrap needed to retain heat"`

---

## Notes

- Only promote when the note has been revisited at least once after writing
- If the insight changes later → update the note, don't create a new one

## Related
- [[AI Capture Workflow]]
- [[Evergreen Notes]]
- [[Process Fleeting Note]]

---
type: area
status: status/active
domain: 
tags:
  - type/area
  - domain/
created: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %>

## Purpose
> What is this ongoing responsibility / scope? What does success look like?

## Current Focus

## Key Projects
```dataview
LIST
FROM "Projects"
WHERE contains(file.tags, "area/<% tp.file.title %>") AND status != "status/done"
```

## Notes & Resources
- [[ ]]

## Review Checklist
- [ ] Is this month's goal on track?
- [ ] Any new projects to create?
- [ ] Any notes to archive?

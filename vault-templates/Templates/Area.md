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
> Trách nhiệm / phạm vi ongoing này là gì? Thành công trông như thế nào?

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
- [ ] Mục tiêu tháng này đang đi đúng hướng?
- [ ] Có project nào cần tạo mới không?
- [ ] Có note nào cần archive không?

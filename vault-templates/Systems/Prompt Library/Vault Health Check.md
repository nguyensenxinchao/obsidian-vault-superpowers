---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# Vault Health Check

Prompt để review vault định kỳ — tìm vấn đề về frontmatter, links, Atomic rule.

---

## Prompt

```
Hãy review vault Obsidian của tôi và kiểm tra các vấn đề sau:

1. **Missing frontmatter**: Files trong Knowledge/ thiếu type, domain, hoặc tags
2. **Broken links**: [[wikilinks]] trỏ đến file không tồn tại
3. **Atomic rule violation**: Notes có nhiều ## section về chủ đề độc lập — gợi ý tách
4. **Inbox tồn đọng**: Notes trong 00 Inbox/ đã > 7 ngày chưa process
5. **Stage stuck**: Knowledge notes ở stage/fleeting > 14 ngày
6. **Empty folders**: Thư mục không có file nào

Với mỗi vấn đề tìm thấy:
- Liệt kê file/location cụ thể
- Gợi ý cách fix
- Ưu tiên: 🔴 Critical / 🟡 Medium / 🟢 Minor
```

---

## Tần suất

- **Weekly**: check Inbox + stage/fleeting tồn đọng
- **Monthly**: check broken links + atomic violations
- **Quarterly**: check empty folders + domain taxonomy

## Related
- [[AI Capture Workflow]]
- [[_Knowledge MOC]]
- [[AGENTS]]

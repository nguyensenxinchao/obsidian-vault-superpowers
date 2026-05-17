---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# AI Capture Workflow

Quy trình đưa insight từ AI (Claude, ChatGPT, ...) vào vault `Main-Brain`.

---

## Nguyên tắc

> **AI là nguồn thô, vault là tri thức đã tiêu hoá.** Không paste blindly — rewrite bằng giọng của mình.

---

## Khi nào capture

| Tình huống | Hành động |
|-----------|-----------|
| Claude giải thích một concept mới | Tạo `Knowledge` note (stage/fleeting) |
| Claude debug / giải quyết vấn đề | Ghi vào daily note phần `## Learnings` |
| Claude tạo ra workflow/process mới | Tạo `Systems` note |
| Claude research một topic dài | Tóm tắt → Inbox → process thành literature note |
| Conversation dài, nhiều insight | Export/paste → `00 Inbox/` dưới dạng fleeting, xử lý sau |

---

## Workflow chi tiết

### Capture nhanh (trong ngày)

1. Claude nói điều valuable → **copy đoạn đó**
2. `Ctrl+Q` (QuickAdd) → tạo note trong `00 Inbox/`
3. Đặt tên mô tả, paste content thô
4. Thêm frontmatter tối thiểu: `type: knowledge`, `stage: fleeting`, `source: AI/Claude`

### Process (EOD hoặc Sunday review)

1. Mở `00 Inbox/`, xem từng note fleeting
2. Rewrite bằng giọng mình — **không copy-paste nguyên văn AI**
3. Điền đầy đủ frontmatter (domain, tags, source)
4. Move sang `Knowledge/<domain>/` → stage = `literature`
5. Thêm link vào MOC tương ứng (`_<domain>_MOC.md`)

### Promote to Evergreen (khi note literature đã chín)

Khi một literature note đã được revisit ≥ 2 lần và insight vẫn đúng:

1. Chạy **Evergreen Checklist** (xem [[AGENTS]] §10)
2. Đổi tên file → **assertion title** (câu khẳng định, không phải keyword)
3. Đảm bảo có ≥ 2 `[[wikilinks]]` outgoing
4. Đổi tag `stage/literature` → `stage/permanent`
5. Update MOC — note này giờ là Evergreen, có thể link tự tin từ mọi nơi

> Dùng prompt [[Promote to Evergreen]] để nhờ AI làm bước này.

---

## Template paste từ AI

Khi tạo note từ AI conversation:

```yaml
---
type: knowledge
domain: <domain>
tags:
  - type/knowledge
  - stage/fleeting
  - domain/<domain>
created: <today>
source: AI/Claude — <topic>
---

# <title>

## Summary
> [Viết lại bằng giọng mình — không paste nguyên AI]

## Key Points
- 
```

---

## Anti-patterns

- ❌ Paste nguyên block text từ Claude mà không rewrite → note vô nghĩa, mất context
- ❌ Tạo note với tên `Untitled` hoặc `Claude response`
- ❌ Không điền `source:` → mất traceability
- ❌ Để fleeting note trong Inbox > 1 tuần mà không process

---

## Related

- [[AGENTS]] — vault conventions tổng
- [[Tagging]] — tag taxonomy
- [[_Knowledge MOC]] — entry point knowledge
- [[Systems/Prompt Library]] — prompts đã tested

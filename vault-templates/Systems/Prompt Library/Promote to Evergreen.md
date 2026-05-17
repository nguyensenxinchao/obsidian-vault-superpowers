---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# Promote to Evergreen

Prompt để AI chuyển một `stage/literature` note → Evergreen (`stage/permanent`).

---

## Prompt

```
Tôi muốn promote note sau lên Evergreen (stage/permanent) trong vault Obsidian của mình.

Note hiện tại:
---
[PASTE NỘI DUNG NOTE + FRONTMATTER]
---

Hãy chạy Evergreen Checklist và thực hiện các bước sau:

**Checklist** (kiểm tra từng item, báo cáo pass/fail):
- [ ] Atomic: note chỉ nói về 1 concept duy nhất?
- [ ] Assertion title: tên file có phải câu khẳng định (không phải keyword)?
- [ ] Own voice: nội dung viết bằng giọng tôi (không phải ngôn ngữ của nguồn)?
- [ ] Links ≥ 2: có ít nhất 2 [[wikilinks]] outgoing?
- [ ] Multi-context: có thể link note này từ ≥ 2 domains khác nhau?

**Nếu note chưa pass checklist:**
1. Báo cáo item nào fail
2. Nếu vi phạm Atomic → đề xuất cách tách thành nhiều notes
3. Nếu thiếu links → suggest [[links]] cụ thể có thể thêm

**Nếu note đã pass (hoặc sau khi fix):**
1. Đề xuất 2-3 assertion title (câu khẳng định, chứa insight cụ thể)
2. Rewrite Summary nếu còn mang hơi hướng nguồn/AI
3. Output: note hoàn chỉnh với frontmatter đã update stage/permanent + tên file mới

Vault conventions: xem [[AGENTS]] §10 và [[Evergreen Notes]].
```

---

## Ví dụ kết quả tốt

**Input title**: `"Nhiệt độ nuôi sâu Canxi"` (keyword)

**Output title options**:
1. `"Nhiệt độ tối ưu nuôi sâu Canxi là 30°C ±2°C"`
2. `"Sâu Canxi cần nhiệt độ trên 25°C để phát triển, tối ưu 30°C"`
3. `"Dưới 25°C ấu trùng sâu Canxi chậm phát triển — cần quây nilong giữ nhiệt"`

---

## Notes

- Chỉ promote khi note đã được revisit ít nhất 1 lần sau khi viết
- Nếu insight thay đổi sau này → update note, không tạo note mới

## Related
- [[AI Capture Workflow]]
- [[Evergreen Notes]]
- [[Process Fleeting Note]]

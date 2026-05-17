name: capture
description: Capture nhanh nội dung thô vào 00 Inbox/ để xử lý sau. Dùng khi không có thời gian process ngay hoặc nội dung chưa đủ để rewrite.
triggers: paste nội dung thô, ghi chú vội, không có thời gian process ngay, sau một cuộc hội thoại dài với AI muốn lưu nhanh
terminal-state: Note fleeting tồn tại trong 00 Inbox/. Nhắc user dùng /process để promote sau.

---

**[ROUTING CHECK — Trước tiên]**

Đọc `$ARGUMENTS`:
- **Insight rõ, có thể viết thành assertion ngay** → *"Nội dung này đủ rõ để tạo note đàng hoàng. Suggest `/note` (literature) hoặc `/evergreen` thay vì Inbox — chọn cái nào?"* → Dừng, chờ.
- **Topic rộng muốn suy nghĩ thêm** → *"Đây có vẻ là topic cần khai phá. Suggest `/brainstorm` — hay muốn capture thô trước rồi brainstorm sau?"* → Dừng, chờ.
- **Nội dung thô, ghi chú vội, chưa xử lý** → Tiếp tục.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Check Inbox**
Đọc `00 Inbox/` để kiểm tra có note liên quan đang chờ không. Nếu có → hỏi: gộp vào đó hay tạo mới?

**[ ] 2. Tạo note trong 00 Inbox/**
- Tên: mô tả nội dung (KHÔNG phải "Untitled" hay "Claude response")
- Frontmatter tối thiểu:
  ```yaml
  type: knowledge
  domain: <tự xác định>
  tags:
    - type/knowledge
    - stage/fleeting
    - domain/<domain>
  created: <hôm nay>
  source: <nếu biết>
  ```
- Summary 1–2 câu bằng giọng Henry
- Nội dung thô giữ nguyên, phân loại vào đúng sections
- Suggest 2–3 `[[wikilinks]]` tiềm năng (chưa cần thêm vào file)

**[ ] 3. Self-review**
- [ ] Tên file có mô tả đúng nội dung không?
- [ ] Domain có hợp lý không?
- [ ] Không có thông tin nhạy cảm nào bị capture không?

**[ ] 4. Verification gate**
- Đọc lại file đã tạo, confirm frontmatter và nội dung đúng
- Báo: *"Đã capture vào `00 Inbox/<tên file>.md` (stage/fleeting)."*
- KHÔNG tuyên bố "xong" nếu chưa verify

**[ ] 5. Terminal state**
Nhắc: *"Note này đang chờ trong Inbox. Dùng `/process` khi sẵn sàng promote lên literature hoặc Evergreen."*

---

## Anti-Patterns

- ❌ Đặt tên file là "Untitled", "Note 1", hay "Claude response"
- ❌ Capture vào Knowledge/ trực tiếp (phải qua Inbox)
- ❌ Bỏ qua frontmatter domain (cần để /process có context)
- ❌ Tuyên bố "xong" mà không verify file tồn tại

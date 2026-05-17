name: process
description: Dọn Inbox và promote fleeting notes lên literature hoặc Evergreen. Dùng trong EOD review hoặc Sunday review. Systematic — từng note một.
triggers: "dọn inbox", "process notes", EOD review, Sunday review, "có gì chờ process không"
terminal-state: Tất cả notes đã được xử lý (promoted, deleted, hoặc deferred). Inbox sạch hoặc rõ ràng tại sao note ở lại.

---

**[ROUTING CHECK — Trước tiên]**

Nếu `$ARGUMENTS` có tên note cụ thể → Nhảy thẳng đến checklist bước 3 với note đó.
Nếu không có argument → Thực hiện full scan từ bước 1.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Scan vault**
Đọc và liệt kê:
- Files trong `00 Inbox/` (trừ README.md)
- Files trong `Knowledge/` có tag `stage/fleeting`

Output format:
```
1. [tên note] | created: YYYY-MM-DD | [tóm tắt 1 câu]
2. ...
```
Sắp xếp: lâu nhất trước (ưu tiên process trước).

Thêm health check nhanh:
- [ ] Có note nào trong Inbox > 7 ngày?
- [ ] Có note fleeting nào trong Knowledge/ > 14 ngày?

**[ ] 2. Hỏi user**
*"Có [N] notes đang chờ. Bạn muốn process note nào? (gõ số thứ tự, hoặc 'tất cả' để đi lần lượt)"*
Dừng, chờ user chọn.

**[ ] 3. Với mỗi note được chọn:**

**[ ] 3a. Đọc nội dung đầy đủ**

**[ ] 3b. Đánh giá và đề xuất action:**
- Note có đủ để promote lên `stage/literature`? → đề xuất `/note`
- Note có đủ để Evergreen ngay? → đề xuất `/evergreen`
- Note không còn giá trị? → đề xuất xóa
- Note cần research thêm? → đề xuất `/brainstorm`

**[ ] 3c. Hỏi user confirm action trước khi thực hiện**

**[ ] 3d. Thực hiện action đã chọn:**
- Nếu promote: rewrite bằng giọng Henry, điền frontmatter, move đúng folder
- Nếu Evergreen: chạy `/evergreen` flow đầy đủ
- Nếu xóa: xóa file, báo lý do
- Nếu defer: update created date, ghi lý do defer trong note

**[ ] 4. Verification gate sau mỗi note**
- Confirm note đã được xử lý đúng (file ở đúng chỗ, frontmatter đúng)
- Nếu promote: confirm MOC đã update
- Nếu xóa: confirm file đã xóa
- Báo kết quả trước khi chuyển sang note tiếp theo

**[ ] 5. Tiếp tục hoặc wrap up**
Sau mỗi note, hỏi: *"Tiếp tục với note tiếp theo không?"*

Khi xong tất cả → báo tổng kết:
```
Processed: [N] notes
- Promoted to literature: [n]
- Promoted to Evergreen: [n]
- Deleted: [n]
- Deferred: [n]
Inbox còn lại: [n] notes
```

---

## Anti-Patterns

- ❌ Process nhiều notes cùng lúc không có confirm của user
- ❌ Promote note mà không rewrite bằng giọng Henry
- ❌ Xóa note mà không hỏi user
- ❌ Bỏ qua verification sau mỗi note
- ❌ Tuyên bố "inbox sạch" mà không verify thực tế

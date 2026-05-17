name: note
description: Tạo knowledge note có cấu trúc từ nội dung đã hiểu. Dùng khi có source rõ ràng hoặc insight đã được tiêu hoá một phần nhưng chưa đủ rõ để Evergreen.
triggers: "vừa đọc bài về X", "tôi hiểu rằng X nhưng chưa chắc chắn", sau /brainstorm khi insight cần research thêm
terminal-state: Note được tạo ở Knowledge/<domain>/ với stage/literature. Nhắc user: dùng /evergreen khi note đã được revisit và insight đã chín.

---

**[ROUTING CHECK — Trước tiên]**

Đọc `$ARGUMENTS`:
- **Topic rộng/vague** ("CORS", "React") → *"Topic này chưa đủ cụ thể. Suggest `/brainstorm` để khai phá trước — đồng ý không?"* → Dừng, chờ.
- **Assertion rõ ràng, atomic** ("JWT stateless nên không revoke được") → *"Insight này đã đủ rõ để Evergreen luôn. Suggest `/evergreen` — đồng ý không?"* → Dừng, chờ.
- **Nội dung thô, paste từ nguồn** → *"Nội dung này chưa được tiêu hoá. Suggest `/capture` vào Inbox trước — hay muốn tôi structure ngay thành literature note?"* → Dừng, chờ.
- **Topic có source rõ, đã hiểu cơ bản** → Tiếp tục.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Check vault context**
- Tìm notes đã có liên quan đến topic
- Nếu note gần giống đã tồn tại → hỏi: gộp vào đó hay tạo mới?

**[ ] 2. Xác định domain và stage**
- Domain: programming / productivity / agriculture / business / health / finance / learning
- Stage: `stage/literature` (mặc định) hoặc `stage/fleeting` nếu chưa đủ context

**[ ] 3. Viết note**
- Tên file: Title Case mô tả chủ đề (KHÔNG phải assertion — đó là việc của `/evergreen`)
- Frontmatter đầy đủ theo schema AGENTS.md §2
- Summary: 1–2 câu bằng **giọng Henry**, không phải ngôn ngữ nguồn
- Điền đủ sections: Key Concepts, Examples, Problems/Gotchas, Related, References
- Đặt ≥ 2 `[[wikilinks]]` outgoing đến notes đã có trong vault

**[ ] 4. Self-review**
Trước khi save, kiểm tra:
- [ ] Summary có phải giọng mình không (không phải copy nguồn)?
- [ ] Domain đúng chưa?
- [ ] Có ít nhất 2 [[links]] chưa?
- [ ] Frontmatter đầy đủ chưa?

**[ ] 5. Update MOC**
Thêm link vào `Knowledge/_meta/_<domain>_MOC.md`.

**[ ] 6. Verification gate**
- Đọc lại file vừa tạo: frontmatter đúng, content có, links hoạt động
- Kiểm tra MOC đã được update
- Báo: *"Đã tạo `[[<tên note>]]` tại `Knowledge/<domain>/`. MOC updated."*
- KHÔNG tuyên bố "xong" nếu chưa verify

**[ ] 7. Terminal state**
Nhắc user: *"Note này đang ở stage/literature. Khi bạn revisit và insight đã chín, dùng `/evergreen <tên note>` để promote lên Evergreen."*

---

## Anti-Patterns

- ❌ Dùng tên file là assertion → đó là việc của `/evergreen`
- ❌ Copy nguyên văn từ nguồn vào Summary
- ❌ Tạo note mà không check vault đã có gì
- ❌ Bỏ qua bước update MOC
- ❌ Tuyên bố "xong" mà không verify file và MOC

name: evergreen
description: Tạo hoặc promote một note lên Evergreen (stage/permanent). Dùng khi insight đã rõ ràng, atomic, và có thể formulate thành assertion title. Đây là "permanent record" — phải đạt chất lượng cao.
triggers: insight đã rõ và atomic, sau /brainstorm khi insight không cần research thêm, sau /note khi note đã được revisit ≥ 1 lần
terminal-state: Evergreen note tồn tại tại Knowledge/<domain>/<assertion>.md với stage/permanent, MOC đã updated. Vault graph đã richer hơn trước.

---

**[ROUTING CHECK — Trước tiên]**

Đọc `$ARGUMENTS`:
- **Keyword/chủ đề** ("CORS", "nuôi sâu") → *"Đây là chủ đề, chưa phải assertion. Một chủ đề có thể thành nhiều Evergreens khác nhau. Suggest `/brainstorm` để khai phá ra assertions cụ thể — đồng ý không?"* → Dừng, chờ.
- **Nội dung dài, nhiều concept** → *"Tôi thấy ít nhất [X] và [Y] là 2 insights riêng biệt. Vi phạm Atomic rule. Muốn tôi tách thành [N] Evergreen notes không?"* → Dừng, chờ confirm.
- **Nội dung thô, chưa rewrite** → *"Nội dung này chưa được tiêu hoá bằng giọng mình. Suggest `/note` (literature) để process trước — đồng ý không?"* → Dừng, chờ.
- **Assertion rõ, atomic, đã hiểu rõ** → Tiếp tục.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Nếu input là tên note đã có — đọc note đó**
- Đọc nội dung hiện tại
- Kiểm tra: đã được revisit chưa, stage hiện tại là gì

**[ ] 2. Evergreen Checklist** (AGENTS.md §10)
Kiểm tra từng item, báo pass/fail:
- [ ] Atomic: chỉ 1 concept duy nhất?
- [ ] Assertion: có thể formulate thành câu khẳng định?
- [ ] Own voice: không mang hơi hướng nguồn hay AI?
- [ ] Linkable: có thể có ≥ 2 outgoing [[links]]?
- [ ] Multi-context: có thể link từ ≥ 2 domains khác nhau?

Nếu bất kỳ item nào fail → báo cụ thể, đề xuất fix, hỏi confirm trước khi tiếp tục.

**[ ] 3. Đề xuất assertion title — 3 candidates**
Viết 3 phiên bản title dạng câu khẳng định. Hỏi user chọn (hoặc tự viết). Dừng, chờ confirm.

**[ ] 4. Tạo/rewrite note** (sau khi user confirm title)
- Path: `Knowledge/<domain>/<assertion title>.md`
- Frontmatter: type/knowledge, stage/permanent, domain đúng, tags đúng schema
- Summary: 1 đoạn, giọng Henry, ngắn gọn súc tích
- Sections: Key Concepts, Examples, Problems/Gotchas, Related (≥ 2 links), References
- Nếu là promote từ note cũ: xóa note cũ sau khi tạo note mới

**[ ] 5. Self-review**
Trước khi báo xong:
- [ ] Title thực sự là assertion (có thể đúng hoặc sai được)?
- [ ] Note có thể đứng độc lập không?
- [ ] Links outgoing ≥ 2 và trỏ đến notes thực sự tồn tại?
- [ ] Summary bằng giọng mình, không phải ngôn ngữ AI?

**[ ] 6. Update MOC**
Thêm link vào `Knowledge/_meta/_<domain>_MOC.md` với ghi chú ngắn.

**[ ] 7. Verification gate**
- Đọc lại file đã tạo để confirm nội dung đúng
- Verify links outgoing trỏ đến files thực sự tồn tại
- Confirm MOC đã được update
- Báo: *"Evergreen note `[[<assertion title>]]` đã tạo. [N] links outgoing. MOC updated."*
- KHÔNG tuyên bố "xong" nếu chưa verify tất cả

---

## Anti-Patterns

- ❌ Promote khi note chưa được revisit dù 1 lần sau khi viết
- ❌ Title vẫn là keyword sau khi gọi là Evergreen
- ❌ Bỏ qua Atomic check — nếu có 2 concepts → phải tách
- ❌ Links trỏ đến files không tồn tại
- ❌ Tuyên bố "xong" mà không verify file và MOC

## Key Principles

- **Chất lượng > số lượng**: 10 Evergreen thực sự tốt hơn 50 note vô hồn
- **Title là assertion**: có thể argue against được
- **Evergreen là living document**: sẽ được cập nhật, không phải viết một lần xong bỏ

name: daily
description: Thêm nội dung vào daily note hôm nay — tasks, learnings, wins, problems, ideas. Dùng cho tracking trong ngày, không phải lưu knowledge lâu dài.
triggers: ghi task mới, vừa hoàn thành gì đó, vừa gặp vấn đề, kết thúc ngày muốn ghi lại, "thêm vào daily"
terminal-state: Nội dung đã được thêm vào đúng section của daily note hôm nay. Nếu là knowledge/insight → hỏi có muốn /note hoặc /evergreen không.

---

**[ROUTING CHECK — Trước tiên]**

Đọc `$ARGUMENTS`:
- **Concept/insight dài hạn** ("JWT stateless nên không revoke được") → *"Đây là knowledge đáng lưu lâu dài, không chỉ trong daily. Muốn tôi làm cả hai: thêm vào daily VÀ tạo `/note` hoặc `/evergreen`?"* → Dừng, chờ confirm.
- **Task/event/win/problem hôm nay** → Tiếp tục.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Đọc daily note hôm nay**
- Tìm file `Daily/<ngày-hôm-nay>.md`
- Nếu chưa tồn tại → tạo từ `Templates/Daily.md` với date đúng

**[ ] 2. Phân loại content vào đúng section**

| Loại | Section | Format |
|------|---------|--------|
| Task cần làm | `## Tasks` | `- [ ] nội dung` |
| Điều học được | `## Learnings` | text hoặc bullet |
| Ý tưởng | `## Ideas` | bullet |
| Vấn đề gặp | `## Problems` | mô tả + context |
| Kết quả tốt | `## Wins` | bullet |
| Ghi chú chung | `## Notes` | free-form |

Nếu không rõ loại → hỏi user.

**[ ] 3. Thêm nội dung — không ghi đè**
Append vào section đúng, giữ nguyên content đã có.

**[ ] 4. Verification gate**
- Đọc lại daily note sau khi thêm, confirm nội dung đúng section
- Báo: *"Đã thêm vào `Daily/<ngày>.md` section `## <Section>`."*
- KHÔNG tuyên bố "xong" nếu chưa verify

**[ ] 5. Terminal state**
Nếu nội dung là insight/learning:
→ *"Điều này có đáng lưu lâu dài không? Nếu có, dùng `/note` hoặc `/evergreen`."*

Nếu là lần `/daily` cuối trong ngày:
→ *"Muốn fill EOD Review luôn không?"*

---

## Anti-Patterns

- ❌ Ghi đè content đã có trong daily
- ❌ Dùng daily để lưu knowledge lâu dài (đó là việc của /note và /evergreen)
- ❌ Tạo daily note không từ template
- ❌ Tuyên bố "xong" mà không verify content đúng section

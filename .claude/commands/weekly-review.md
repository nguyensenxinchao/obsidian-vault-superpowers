name: weekly-review
description: Use when doing end-of-week vault maintenance — process inbox, promote stale notes, update MOCs, check vault health. Run every Sunday or at end of sprint.
triggers: "review cuối tuần", "vault review", "Sunday review", "dọn dẹp vault", cuối tuần, cuối sprint
terminal-state: Inbox cleared, stale notes processed, MOCs updated, vault health report generated. Tất cả actions đã verified.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Inbox audit**
Scan `00 Inbox/` (trừ README.md):
- Liệt kê tất cả notes: tên | ngày tạo | tóm tắt 1 câu
- Flag: notes > 7 ngày → ưu tiên process
- Hỏi user muốn `/process` từng cái hay skip week này

**[ ] 2. Stale fleeting notes**
Scan `Knowledge/` có `stage/fleeting`:
- Liệt kê: tên | ngày tạo | domain
- Flag: notes > 14 ngày → cần quyết định: promote hay delete
- Với mỗi note: đề xuất action, hỏi confirm

**[ ] 3. Literature notes sẵn sàng promote**
Scan `Knowledge/` có `stage/literature`:
- Tìm notes đã > 14 ngày VÀ có ≥ 2 outgoing links
- Đề xuất: "Note này có vẻ sẵn sàng để Evergreen. Muốn `/evergreen` không?"
- Không tự promote — hỏi confirm từng cái

**[ ] 4. MOC health check**
Kiểm tra từng domain MOC trong `Knowledge/_meta/`:
- Có Evergreen note mới chưa được thêm vào MOC?
- Có link broken trong MOC?
- MOC nào cần tạo mới (domain có > 5 notes nhưng chưa có MOC)?

**[ ] 5. Vault health scan**
Chạy các checks:
- [ ] Files thiếu frontmatter `type:` → list ra
- [ ] Files có `type: knowledge` nhưng thiếu `domain:` → list ra
- [ ] Files có `tags:` rỗng → list ra
- [ ] Wikilinks broken (link đến file không tồn tại) → list ra
- [ ] Folders rỗng → list ra

**[ ] 6. Self-review report**
Trước khi show user, compile report:
- Tổng số issues tìm thấy theo category
- Actions đã thực hiện
- Actions cần user quyết định

**[ ] 7. Verification gate**
Sau khi thực hiện fixes:
- Verify từng fix đã đúng (re-read files, check MOCs)
- Confirm Inbox đã giảm (nếu đã process)
- KHÔNG tuyên bố "vault clean" mà không verify thực tế

**[ ] 8. Generate weekly report**
Tạo/update section trong daily note hôm nay:
```markdown
## Weekly Vault Review — <ngày>
- Inbox processed: [n] notes
- Promoted to literature: [n]
- Promoted to Evergreen: [n]
- Deleted: [n]
- Issues found: [list]
- Issues fixed: [list]
- Issues deferred: [list]
```

**[ ] 9. Terminal state**
Hỏi: *"Có gì muốn `/brainstorm` hay `/plan` cho tuần tới không?"*

---

## Anti-Patterns

- ❌ Process tất cả notes mà không hỏi user từng cái
- ❌ Xóa note mà không confirm
- ❌ Promote lên Evergreen mà không chạy Evergreen Checklist
- ❌ Báo "vault clean" mà không verify thực tế
- ❌ Bỏ qua MOC health check

## Key Principles

- **Systematic, không ad-hoc**: theo đúng thứ tự checklist
- **User decides**: AI đề xuất, user quyết định — đặc biệt với delete và promote
- **Evidence-based**: báo số liệu thực, không estimate

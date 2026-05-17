name: new-skill
description: Use when creating a new vault slash command. Follows TDD methodology — define the problem and test case BEFORE writing the skill. No skill without a failing test first.
triggers: "tạo command mới", "thêm slash command", "muốn có / cho việc X", "viết skill mới"
terminal-state: Skill file tồn tại tại .claude/commands/<name>.md, đã được test với ít nhất 1 test case, AGENTS.md đã được update.

---

**NGUYÊN TẮC: Mọi skill đều cần failing test TRƯỚC. Không có ngoại lệ, kể cả "skill đơn giản".**

TDD cho skill creation: RED (define test) → GREEN (write minimal skill) → REFACTOR (close loopholes).

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Define the problem**
Hỏi user: *"Skill này giải quyết vấn đề gì cụ thể? Bạn thường phải nhắc AI điều gì mà bạn muốn AI tự biết?"*
Chờ trả lời. Phát biểu problem rõ ràng.

**[ ] 2. Check existing skills**
Đọc tất cả files trong `.claude/commands/`:
- Skill này có overlap với skill đã có không?
- Có thể enhance skill cũ thay vì tạo mới không?
Nếu có → đề xuất enhance thay vì tạo mới.

**[ ] 3. Write the test case FIRST (RED)**
Mô tả cụ thể một interaction thành công:
```
Test: User gõ /[skill-name] [input]
Expected behavior:
1. AI làm X
2. AI hỏi Y
3. AI tạo file Z tại path W
4. AI verify bằng cách A
5. AI báo kết quả B
```
Hỏi user: test case này có đúng không?

**[ ] 4. Write minimal skill (GREEN)**
Viết skill chỉ đủ để pass test case. Format bắt buộc:
```markdown
name: <skill-name>
description: Use when <triggering condition — NOT workflow summary>. 
triggers: <explicit trigger phrases>
terminal-state: <luôn kết thúc bằng gì>

---

## Checklist — Hoàn thành theo đúng thứ tự này

[ROUTING CHECK nếu cần]

**[ ] 1. ...**
**[ ] 2. ...**
...
**[ ] N. Verification gate**
...
**[ ] N+1. Terminal state**
...

---

## Anti-Patterns
- ❌ ...

## Key Principles
- ...
```

**Quan trọng về `description:`**
- Phải bắt đầu bằng "Use when..."
- Chỉ mô tả TRIGGERING CONDITIONS, không mô tả workflow
- Claude có thể chỉ đọc description mà không đọc full skill — phải đủ để trigger đúng

**[ ] 5. Refactor — close loopholes (REFACTOR)**
Đọc lại skill và tìm:
- [ ] Có chỗ nào AI có thể "cheat" (bỏ qua step) không?
- [ ] Có chỗ nào mơ hồ, có thể interpret nhiều cách không?
- [ ] Verification gate có thực sự verify đúng thứ cần verify không?
- [ ] Anti-patterns có cover các failure modes thực tế không?

Fix inline.

**[ ] 6. Lưu skill file**
Tạo `.claude/commands/<name>.md` với nội dung đã viết.

**[ ] 7. Test thủ công**
Chạy test case từ bước 3: gõ `/[skill-name] [input từ test]`
Verify output match expected behavior.

**[ ] 8. Update AGENTS.md**
Thêm skill mới vào bảng slash commands trong AGENTS.md §7.

**[ ] 9. Verification gate**
- Confirm file tồn tại tại `.claude/commands/<name>.md`
- Confirm AGENTS.md đã update
- Confirm skill đã pass test case
- KHÔNG tuyên bố "xong" nếu chưa test

---

## Anti-Patterns

- ❌ Viết skill trước khi có test case
- ❌ Description mô tả workflow thay vì triggering conditions
- ❌ Skill không có verification gate
- ❌ Skill không có terminal state rõ ràng
- ❌ Tạo skill cho one-off task (skill phải reusable)
- ❌ Duplicate skill đã có — enhance thay vì tạo mới

## Key Principles

- **TDD không thương lượng**: test trước, skill sau
- **Minimal**: skill chỉ làm đúng một việc rõ ràng
- **Description = trigger, không phải summary**
- **Reusable**: nếu chỉ dùng 1 lần → không cần skill

name: plan
description: Use when a topic requires structured research across multiple sessions, or when brainstorm output has open questions needing systematic investigation. Creates a written research plan saved to Systems/Specs/.
triggers: sau /brainstorm khi có open questions phức tạp, topic cần research nhiều nguồn, muốn tackle một domain mới một cách có hệ thống
terminal-state: Research plan tồn tại tại Systems/Specs/YYYY-MM-DD-<topic>-plan.md. Luôn kết thúc bằng việc hỏi user muốn execute ngay hay để sau.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Load context**
- Đọc spec doc liên quan nếu đã có từ `/brainstorm` (tìm trong `Systems/Specs/`)
- Đọc notes liên quan trong vault
- Báo: *"Tôi thấy context hiện tại: [X]. Plan sẽ build on top of đó."*

**[ ] 2. Hỏi làm rõ scope — một câu mỗi lần**
Tập trung vào:
- Depth: muốn đi đến mức nào? (overview vs. deep expertise)
- Time: có deadline hay milestone nào không?
- Output: plan này để tạo ra note gì? (literature? evergreen? project?)

**[ ] 3. Đề xuất 2–3 research approach**
Với trade-offs. Lead với recommendation. Ví dụ:
- Breadth-first: survey nhiều nguồn, capture tổng quan trước
- Depth-first: đào sâu 1 nguồn chính, branch ra từ đó
- Problem-first: bắt đầu từ pain point cụ thể, research backward

**[ ] 4. Viết research plan** (sau khi user approve approach)

Cấu trúc plan:
```markdown
# Research Plan: <topic>
## Goal
[Outcome cụ thể: tôi sẽ có gì sau khi hoàn thành plan này?]

## Scope
[Trong phạm vi / Ngoài phạm vi]

## Research Steps
### Step 1: [tên bước] — [thời gian ước tính]
- Source/action cụ thể
- Output: [note gì sẽ được tạo]
- Done when: [điều kiện hoàn thành bước này]

### Step 2: ...

## Knowledge Notes sẽ tạo
- [ ] [tên note tiềm năng] (stage/literature)
- [ ] [assertion tiềm năng] → Evergreen

## Open Questions (từ brainstorm)
- ?
```

**[ ] 5. Self-review plan**
Trước khi show user:
- [ ] Mỗi step có output cụ thể không?
- [ ] Có step nào "TBD" hay mơ hồ không? → Fix ngay
- [ ] Scope có realistic không? (không quá rộng cho 1 plan)
- [ ] Done criteria có đo được không?

**[ ] 6. Lưu plan**
Tạo file `Systems/Specs/YYYY-MM-DD-<topic>-plan.md` với nội dung plan.

**[ ] 7. Verification gate**
- Đọc lại file đã lưu, confirm nội dung đúng
- Báo: *"Plan đã lưu tại `Systems/Specs/<filename>.md`"*
- KHÔNG tuyên bố "xong" nếu chưa verify file tồn tại

**[ ] 8. Terminal state**
Hỏi user: *"Muốn bắt đầu execute Step 1 ngay không? (tôi sẽ dùng /note hoặc /evergreen sau mỗi step)"*

---

## Anti-Patterns

- ❌ Plan không có output cụ thể cho mỗi step
- ❌ Step có "research X" mà không có "tạo note gì từ research đó"
- ❌ Scope quá rộng (1 plan = 1 outcome, không phải 10 outcomes)
- ❌ Không lưu plan ra file — phải có artifact
- ❌ Bắt đầu execute mà không lưu plan trước

## Key Principles

- **Plan trước, execute sau**: không bao giờ nhảy thẳng vào research
- **Output-oriented**: mỗi step phải tạo ra note cụ thể
- **YAGNI**: chỉ plan những gì thực sự cần, không plan "just in case"

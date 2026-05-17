name: brainstorm
description: Dùng TRƯỚC bất kỳ note-taking session nào khi topic còn mơ hồ — khám phá intent, define insight, chọn capture strategy. Auto-trigger khi user nói "tôi muốn tìm hiểu về X" hoặc topic rộng hơn 1 concept.
triggers: topic rộng, muốn khai phá, chưa biết note nên là gì, "tôi muốn học về X"
terminal-state: Luôn kết thúc bằng (1) lưu spec doc vào Systems/Specs/ VÀ (2) user chọn /note, /evergreen, hoặc /plan để tiếp tục.

---

**[ROUTING CHECK — Trước tiên]**

Đọc `$ARGUMENTS` và kiểm tra:
- Nếu đã là **assertion cụ thể** ("JWT không có built-in revocation") → *"Insight này đã rõ. Suggest `/evergreen` thay vì brainstorm — đồng ý không?"* → Dừng, chờ.
- Nếu là **task/action** ("setup CORS middleware") → *"Đây là task. Suggest `/daily` — hay bạn muốn hiểu sâu về topic này?"* → Dừng, chờ.
- Nếu là **topic rộng cần khai phá** → Tiếp tục checklist bên dưới.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Explore context**
Trước khi hỏi bất cứ điều gì, đọc vault để hiểu context hiện tại:
- Tìm notes liên quan đến topic (grep tên, domain)
- Đọc MOC tương ứng nếu có
- Báo ngắn: *"Tôi thấy vault đã có: [X, Y]. Sẽ build on top of đó."*

**[ ] 2. Hỏi làm rõ — một câu mỗi lần**
Hỏi từng câu, chờ trả lời trước khi hỏi câu tiếp theo. Ưu tiên câu hỏi dạng multiple choice. Tập trung vào:
- Mục đích: *Tại sao* bạn muốn hiểu topic này?
- Scope: Bạn muốn đi sâu đến mức nào?
- Output: Muốn dùng knowledge này để làm gì?

**[ ] 3. Đề xuất 2–3 góc tiếp cận**
Sau khi hiểu scope, đề xuất 2–3 hướng khai phá khác nhau với trade-offs. Lead với recommendation của bạn và giải thích tại sao.

**[ ] 4. Khai phá (với approval của user)**
Sau khi user chọn hướng:
- Đặt 5–7 câu hỏi khai phá (divergent thinking)
- Vẫn: **một câu mỗi lần**, chờ trả lời

**[ ] 5. Tổng hợp insights**
Sau khi khai phá xong, tổng hợp:
- 3–5 insight dạng **assertion** (câu khẳng định có thể đúng/sai)
- 1–2 questions còn open, cần research thêm
- 1–2 action items tiếp theo

**[ ] 6. Self-review trước khi show user**
Kiểm tra nhanh output:
- [ ] Mỗi insight có thực sự là assertion (không phải keyword)?
- [ ] Có insight nào overlap nhau không (vi phạm Atomic)?
- [ ] Có insight nào quá vague không?
Fix inline trước khi tiếp tục.

**[ ] 7. Lưu spec doc**
Tạo file `Systems/Specs/YYYY-MM-DD-<topic>-spec.md` với nội dung:
```yaml
---
type: system
status: status/active
tags: [type/system, meta/spec]
created: <hôm nay>
topic: <topic>
---
# Brainstorm Spec: <topic>
## Context (từ vault)
## Intent & Scope
## Insights (assertions)
## Open Questions
## Next Steps
```

**[ ] 8. Verification gate**
Sau khi tạo file:
- Đọc lại file vừa tạo để confirm nội dung đúng
- Báo: *"Đã lưu spec tại `Systems/Specs/<filename>.md`"*
- KHÔNG tuyên bố "xong" nếu chưa verify file tồn tại với đúng nội dung

**[ ] 9. Capture decision — terminal state**
Với mỗi insight trong spec, hỏi user:
- Insight rõ, atomic → `/evergreen <assertion>`
- Cần research thêm → `/note <topic>` (literature)  
- Cần planning phức tạp → `/plan <topic>`
- Chưa chắc → để lại trong spec, review sau

---

## Anti-Patterns

- ❌ Hỏi nhiều câu cùng lúc → chỉ 1 câu mỗi message
- ❌ Bỏ qua context trong vault → luôn đọc vault trước
- ❌ Không lưu spec doc → output phải có file, không chỉ chat
- ❌ Tuyên bố "xong" mà không verify file tồn tại
- ❌ Insights là keywords, không phải assertions

## Key Principles

- **YAGNI cho PKM**: đừng khai phá những gì bạn chưa cần ngay
- **Build on existing**: vault đã có gì → đừng duplicate, hãy link
- **Assertion-first**: mọi insight phải formulate được thành assertion
- **One question at a time**: không thương lượng

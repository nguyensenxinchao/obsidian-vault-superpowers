---
type: system
status: status/active
tags:
  - type/system
  - meta/taxonomy
created: 2026-05-18
---

# Vault Methodology

Hướng dẫn sử dụng hệ thống skills cho vault `Main-Brain`. Đọc file này để hiểu khi nào dùng skill nào và tại sao.

> Inspired by: [Superpowers](https://github.com/obra/superpowers) — adapted for PKM/Obsidian thay vì coding.

---

## Nguyên tắc cốt lõi

**1. Invoke skill TRƯỚC khi làm bất cứ điều gì.**
Khi nhận một yêu cầu, kiểm tra ngay xem có skill nào phù hợp không. Ngay cả 1% khả năng applicable → check skill. Đừng rationalize để bỏ qua.

**2. Priority hierarchy:**
```
User's explicit instructions  (cao nhất)
        ↓
Vault skills (AGENTS.md + .claude/commands/)
        ↓
Default AI behavior           (thấp nhất)
```

**3. Verification gate — không thương lượng.**
Không bao giờ tuyên bố "xong" mà không verify bằng evidence:
- File đã được tạo? → Đọc lại file
- MOC đã update? → Kiểm tra file MOC
- Link không broken? → Verify file target tồn tại
Phrases như "should work", "probably done", "I think" = chưa verify.

**4. One question at a time.**
Không bao giờ hỏi nhiều câu cùng lúc. Hỏi → chờ → hỏi tiếp.

**5. YAGNI cho PKM.**
Đừng tạo note, MOC, hay folder "just in case". Chỉ tạo khi có content thực.

---

## Skill Map

### Khi nào dùng skill nào

```
Topic/ý tưởng mới
    ↓
Topic còn mơ hồ? ──── YES ──→ /brainstorm
    │
    NO
    ↓
Cần planning phức tạp? ── YES ──→ /plan
    │
    NO
    ↓
Insight đã rõ, atomic? ─ YES ──→ /evergreen
    │
    NO
    ↓
Có source rõ, hiểu cơ bản? ─ YES ──→ /note
    │
    NO
    ↓
Nội dung thô, chưa có thời gian? ──→ /capture

Tracking hôm nay: tasks/wins/problems ──→ /daily
Dọn Inbox, promote notes ──────────────→ /process
Cuối tuần: vault maintenance ──────────→ /weekly-review
Vault có lỗi, link broken ─────────────→ /debug-vault
Tạo command mới ───────────────────────→ /new-skill
```

---

## Tất cả Skills

| Skill | Trigger | Terminal State |
|-------|---------|----------------|
| `/brainstorm` | Topic rộng, chưa biết insight là gì | Spec doc lưu trong `Systems/Specs/` + user chọn /note hoặc /evergreen |
| `/plan` | Open questions cần research có hệ thống | Plan doc lưu trong `Systems/Specs/` + hỏi execute ngay không |
| `/note` | Source rõ, insight đã hiểu một phần | Literature note tại `Knowledge/<domain>/` |
| `/evergreen` | Insight rõ, atomic, assertion-ready | Permanent note tại `Knowledge/<domain>/`, MOC updated |
| `/capture` | Nội dung thô, capture nhanh vào Inbox | Fleeting note tại `00 Inbox/` |
| `/daily` | Task/event/win/problem hôm nay | Nội dung thêm vào `Daily/<hôm nay>.md` |
| `/process` | Dọn Inbox, promote fleeting notes | Inbox cleared, notes promoted hoặc deleted |
| `/weekly-review` | Cuối tuần, vault maintenance | Health report, MOCs updated, Inbox cleared |
| `/debug-vault` | Vault có lỗi, behavior bất thường | Root cause xác định, fix verified |
| `/new-skill` | Muốn thêm command mới | Skill file + test case + AGENTS.md updated |

---

## Pipelines phổ biến

### Pipeline: Khai phá một topic mới
```
/brainstorm [topic]
    → Spec doc lưu tại Systems/Specs/
    → Với mỗi insight: /evergreen hoặc /note
    → Nếu cần research thêm: /plan
    → Track tasks liên quan: /daily
```

### Pipeline: Học từ một source (bài viết, video, sách)
```
/capture [paste nội dung thô]
    → Note fleeting tại Inbox
    → /process (khi sẵn sàng)
    → /note (literature) hoặc /evergreen trực tiếp
```

### Pipeline: Insight bật ra trong đầu
```
/evergreen [assertion ngay]
    → Checklist → assert title → tạo permanent note
```

### Pipeline: Cuối tuần
```
/weekly-review
    → Inbox audit → stale notes → MOC health → vault health
    → /process từng note đang chờ
    → Tạo daily note với summary
```

---

## Anti-Rationalization Rules

Nếu bạn (AI) đang nghĩ những điều sau → đó là rationalization, hãy dừng lại và check skill:

- *"Câu hỏi này quá đơn giản để cần skill"*
- *"Tôi cần thêm context trước khi invoke skill"*
- *"User chỉ muốn câu trả lời nhanh"*
- *"Skill này không hoàn toàn phù hợp"*
- *"Tôi đã biết phải làm gì rồi"*
- *"Skill này sẽ làm chậm quá trình"*

**Nếu skill tồn tại và có khả năng applicable → invoke nó.**

---

## Folder Structure của Skill Artifacts

```
Systems/
├── Vault Methodology.md    ← file này
├── AI Capture Workflow.md
├── Specs/                  ← output của /brainstorm và /plan
│   └── YYYY-MM-DD-<topic>-spec.md
│   └── YYYY-MM-DD-<topic>-plan.md
└── Prompt Library/         ← prompts thủ công (legacy)
.claude/
└── commands/               ← skill files
    ├── brainstorm.md
    ├── plan.md
    ├── note.md
    ├── evergreen.md
    ├── capture.md
    ├── daily.md
    ├── process.md
    ├── weekly-review.md
    ├── debug-vault.md
    └── new-skill.md
```

---

## Related

- [[AGENTS]] — vault conventions tổng, §7 slash commands
- [[AI Capture Workflow]] — quy trình AI → vault
- [[Evergreen Notes]] — triết lý Evergreen notes
- [[_Knowledge MOC]] — entry point knowledge

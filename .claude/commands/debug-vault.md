name: debug-vault
description: Use when vault has quality problems — broken links, missing frontmatter, notes violating conventions, or Dataview queries returning wrong results. Systematic investigation BEFORE any fixes.
triggers: "có gì đó sai trong vault", broken links, dataview query không đúng, "tại sao note X không hiện trong MOC", vault health check, "tìm lỗi trong vault"
terminal-state: Root cause đã xác định, fixes đã apply và verified. Báo cáo rõ: vấn đề gì, nguyên nhân gì, đã fix gì.

---

**NGUYÊN TẮC CỐT LÕI: KHÔNG FIX GÌ TRƯỚC KHI TÌM ĐƯỢC ROOT CAUSE.**

Nếu sau 3 lần fix mà vẫn sai → đây là vấn đề structural, cần đặt lại câu hỏi về architecture, không phải fix tiếp.

---

## Checklist — Hoàn thành theo đúng thứ tự này

**[ ] 1. Tái hiện vấn đề**
Hiểu chính xác triệu chứng:
- Vấn đề cụ thể là gì? (link broken? dataview sai? note mất?)
- Nó xảy ra ở đâu (file nào, section nào)?
- Có reproducible không?

**[ ] 2. Đọc error/evidence**
- Đọc file bị lỗi
- Đọc Dataview query (nếu có)
- Đọc frontmatter của notes liên quan
- KHÔNG đoán — phải đọc thực tế

**[ ] 3. Pattern analysis — tìm điểm khác biệt**
- Tìm note/link tương tự ĐANG HOẠT ĐỘNG
- So sánh note lỗi với note đúng: khác nhau ở chỗ nào?
- Check: frontmatter fields, tag format, file path, wikilink syntax

**[ ] 4. Xác định root cause**
Phát biểu hypothesis rõ ràng:
*"Tôi tin rằng vấn đề là [X] vì [bằng chứng Y]."*

Nếu không thể phát biểu hypothesis rõ → quay lại bước 2, đọc thêm.

**[ ] 5. Test hypothesis**
Thay đổi MỘT biến duy nhất để test. Không fix nhiều thứ cùng lúc.

**[ ] 6. Implement fix**
Chỉ sau khi hypothesis được confirm:
- Fix root cause, không phải symptom
- Áp dụng fix một cách consistent (nếu vấn đề xuất hiện ở nhiều files)

**[ ] 7. Verification gate**
- Verify vấn đề ban đầu đã được fix
- Verify fix không gây ra vấn đề mới
- Nếu dùng Dataview: re-read query output để confirm
- Báo: *"Root cause: [X]. Fix: [Y]. Verified bằng: [Z]."*
- KHÔNG tuyên bố "xong" nếu chưa verify

**[ ] 8. Prevention note**
Nếu vấn đề có thể tái phát → đề xuất thêm vào AGENTS.md như anti-pattern.

---

## Common Vault Bugs & Root Causes

| Triệu chứng | Root cause thường gặp |
|-------------|----------------------|
| Note không hiện trong Dataview | `type:` sai, tag format sai, sai folder path trong query |
| Wikilink broken | File đã rename/move, tên file khác với link text |
| Note không hiện trong MOC | Chưa thêm link vào MOC, hoặc Dataview filter sai |
| stage/permanent nhưng tên vẫn là keyword | Chưa rename file khi promote lên Evergreen |
| Frontmatter parse lỗi | Indentation sai, ký tự đặc biệt trong value |

---

## Anti-Patterns

- ❌ Fix trước khi tìm root cause
- ❌ "Thử" nhiều fix cùng lúc — không biết cái nào có tác dụng
- ❌ Tuyên bố "đã fix" mà không verify
- ❌ Fix symptom thay vì nguyên nhân
- ❌ Sau 3 fix thất bại vẫn tiếp tục fix thay vì đặt lại câu hỏi

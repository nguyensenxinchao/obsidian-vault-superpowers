---
type: system
status: status/active
tags:
  - type/system
  - domain/productivity
created: 2026-05-18
---

# Process Fleeting Note

Prompt để chuyển một fleeting note thô → literature note đúng schema.

---

## Prompt

```
Tôi có một fleeting note sau đây trong vault Obsidian của mình:

---
[PASTE NỘI DUNG NOTE]
---

Hãy giúp tôi process note này thành một knowledge note đúng schema của vault:

1. Viết lại Summary bằng 1-2 câu rõ ràng, súc tích (giọng của tôi, không phải copy nguyên văn nguồn)
2. Tổ chức nội dung vào các sections: Key Concepts, Examples, Problems/Gotchas
3. Đề xuất domain phù hợp (xem: programming, productivity, agriculture, business, health, finance, learning)
4. Đề xuất 2-3 wikilinks [[note]] liên quan có thể đã tồn tại trong vault
5. Đổi stage từ fleeting → literature

Output: toàn bộ note theo format markdown với frontmatter đầy đủ.
```

---

## Notes

- Luôn review output trước khi save — AI có thể hiểu sai context
- Nếu concept quá phức tạp → tách thành nhiều atomic notes

## Related
- [[AI Capture Workflow]]
- [[Vault Health Check]]

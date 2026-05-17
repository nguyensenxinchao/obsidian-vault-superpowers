# AGENTS.md — Vault Conventions

Tài liệu này nói cho **AI assistants** (Claudian, Claude Code, …) cách làm việc với vault này.

> Vault này là "second brain" cá nhân của **YOUR_NAME** (YOUR_EMAIL). Phong cách: PARA + Atomic Notes + Zettelkasten linking. Folder không quan trọng bằng links và metadata.

---

## 1. Vault structure

```
YourVault/
├── 00 Inbox/        # Capture nhanh, chưa process (review hàng ngày)
├── Daily/           # Daily notes — capture stream theo ngày
├── Projects/        # Outcome-oriented, có deadline (PARA: P)
├── Areas/           # Trách nhiệm ongoing, không deadline (PARA: A)
├── Resources/       # Tham khảo, links, docs ngoài (PARA: R)
├── Knowledge/       # Atomic notes — concepts, learnings (Zettel layer)
│   └── _meta/       # MOCs, taxonomy notes (prefix `_` để sort lên đầu)
├── Systems/         # Workflows, processes, automation, prompt libs
├── Ideas/           # Seeds chưa thành project
├── Excalidraw/      # Diagrams
├── Archive/         # Done / inactive (PARA: Archive)
└── Templates/       # Templater templates
```

**Quy tắc routing**: Khi tạo note mới mà chưa biết đặt đâu → `00 Inbox/`. Đừng tự tiện tạo folder con mới — hỏi user trước.

---

## 2. Frontmatter schemas (bắt buộc)

Mọi note **phải** có frontmatter. Các trường bắt buộc theo từng `type`:

### `type: daily`
```yaml
type: daily
date: YYYY-MM-DD
tags: [type/daily]
```

### `type: knowledge`
```yaml
type: knowledge
domain: <string>       # vd: productivity, programming, agriculture
tags: [type/knowledge, stage/{fleeting|literature|permanent}]
created: YYYY-MM-DD
source: <url|book|conversation>   # optional
```

### `type: project`
```yaml
type: project
status: status/{active|on-hold|done|abandoned}
domain: <string>
tags: [type/project]
created: YYYY-MM-DD
deadline: YYYY-MM-DD   # optional
```

### `type: idea`
```yaml
type: idea
status: status/{seed|exploring|promoted|dropped}
domain: <string>
tags: [type/idea]
created: YYYY-MM-DD
```

### `type: meeting`
```yaml
type: meeting
date: YYYY-MM-DD
participants: [name1, name2]
tags: [type/meeting]
```

### `type: system`
```yaml
type: system
status: status/{active|deprecated}
tags: [type/system]
created: YYYY-MM-DD
```

### `type: moc`
```yaml
type: moc
domain: <string>
tags: [moc]
created: YYYY-MM-DD
```

### `type: resource`
```yaml
type: resource
domain: <string>
tags: [type/resource, domain/<domain>]
created: YYYY-MM-DD
source: <url|book>
```

### `type: area`
```yaml
type: area
status: status/{active|on-hold|archived}
domain: <string>
tags: [type/area, domain/<domain>]
created: YYYY-MM-DD
```

---

## 3. Tag taxonomy

- **`type/`** — phản ánh `type:` trong frontmatter
- **`status/`** — vòng đời: `status/active`, `status/done`, `status/seed`, …
- **`stage/`** — chỉ áp dụng cho knowledge: `stage/fleeting` → `stage/literature` → `stage/permanent`
- **`domain/`** — chủ đề lớn: `domain/programming`, `domain/productivity`, … *(tùy chỉnh theo nhu cầu)*
- **`meta/`** — note hệ thống: `meta/inbox`, `meta/template`, `meta/taxonomy`

**Quy ước**: hierarchical, lowercase, kebab-case. Không dùng tag flat.

---

## 4. Naming convention

- **File**: Title Case. Không dùng `.md.md`.
- **Evergreen (stage/permanent)**: tên file là **assertion title** — câu khẳng định, không phải keyword.
  - ❌ `"CORS.md"` — keyword
  - ✅ `"Preflight request chỉ xảy ra khi request không phải simple request.md"` — assertion
- **MOC**: prefix `_` để sort lên đầu folder
- **Daily**: `YYYY-MM-DD.md`

---

## 5. Atomic Notes rule

**Một note = một concept**. Nếu note có nhiều `##` section nói về các chủ đề độc lập → tách. Mỗi note phải có thể đứng độc lập và được link từ nhiều nơi khác nhau.

---

## 6. Hành vi khi AI assist

Khi user yêu cầu tạo/edit note:
1. **Kiểm tra Inbox trước** — có note liên quan đang chờ process không
2. **Tạo note với template đúng** — đọc `Templates/<type>.md`
3. **Suggest links** — đề xuất 2-5 `[[link]]` đến note đã có
4. **Update MOC** — nếu tạo knowledge note mới, thêm link vào MOC domain
5. **Không tạo file rác** — không tạo `Untitled.md`
6. **Frontmatter trước, content sau**
7. **Evergreen promotion** — khi promote lên permanent: chạy Evergreen Checklist (§10), đổi tên thành assertion title

Khi review vault:
- Check files thiếu frontmatter
- Check broken links
- Check note vi phạm Atomic rule
- Check Inbox tồn đọng > 1 tuần
- Check `stage/literature` > 14 ngày → suggest promote to Evergreen

---

## 7. Slash commands (dùng ngay trong Claudian)

Mỗi skill có Routing Check, ordered checklist, verification gate, và terminal state rõ ràng. Xem [[Vault Methodology]].

| Skill | Khi nào dùng | Terminal State |
|-------|-------------|----------------|
| `/brainstorm` | Topic rộng, chưa biết insight là gì | Spec doc lưu `Systems/Specs/` |
| `/plan` | Cần research có hệ thống | Plan doc lưu `Systems/Specs/` |
| `/note` | Source rõ, đã hiểu cơ bản | Note tại `Knowledge/<domain>/` |
| `/evergreen` | Insight rõ, atomic, assertion-ready | Permanent note + MOC updated |
| `/capture` | Nội dung thô, capture nhanh | Fleeting note tại `00 Inbox/` |
| `/daily` | Task / win / problem / learning hôm nay | Thêm vào daily note |
| `/process` | Dọn Inbox, promote stale notes | Inbox cleared |
| `/weekly-review` | Cuối tuần, vault maintenance | Health report |
| `/debug-vault` | Vault có lỗi, link broken | Root cause + fix verified |
| `/new-skill` | Muốn thêm command mới | Skill file + test + AGENTS.md updated |

---

## 8. Plugins cần có

- **Templater** — template engine (`undefined` syntax)
- **Dataview** — query notes theo frontmatter
- **Tasks** — `- [ ]` với due date
- **QuickAdd** — hotkey capture vào Inbox
- **Omnisearch** — full-text search
- **Claudian** (`realclaudian`) — AI agent plugin nhúng Claude Code vào vault

---

## 9. Không làm gì

- ❌ Tạo vault tách theo chủ đề — gây fragmentation
- ❌ Dùng folder thay cho link
- ❌ Note đa-chủ-đề (vi phạm Atomic)
- ❌ Frontmatter rỗng / sai schema
- ❌ Tag flat (`#cors`, `#bug`) — luôn hierarchical
- ❌ Tuyên bố "xong" mà không verify file thực sự tồn tại

---

## 10. Evergreen Notes

`stage/permanent` = Evergreen note. Xem [[Evergreen Notes]].

### Evergreen Checklist (AI phải kiểm tra trước khi promote)

- [ ] Atomic: note chỉ nói về 1 concept?
- [ ] Assertion title: tên file là câu khẳng định, không phải keyword?
- [ ] Own voice: viết bằng giọng mình, không phải ngôn ngữ nguồn/AI?
- [ ] Links ≥ 2: có ít nhất 2 `[[wikilinks]]` outgoing?
- [ ] Multi-context: có thể link từ ≥ 2 domains khác nhau?

---

## 11. Khi không chắc — hỏi user

AI không tự ý:
- Xoá note có nội dung
- Refactor MOC structure
- Đổi tên domain trong taxonomy
- Tạo top-level folder mới

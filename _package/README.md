# Obsidian Vault Superpowers

> A PKM skills framework for [Claudian](https://github.com/YishenTu/claudian) — bringing structured, AI-powered note-taking workflows to your Obsidian vault.

Inspired by [Superpowers](https://github.com/obra/superpowers) (a coding agent skills framework) — adapted for Personal Knowledge Management.

---

## What is this?

10 slash commands that transform how you take notes with AI in Obsidian:

| Command | What it does |
|---------|-------------|
| `/brainstorm` | Explore a topic through dialogue → save spec doc → route to right command |
| `/plan` | Create a structured research plan before diving in |
| `/note` | Capture a literature note (well-understood topic with source) |
| `/evergreen` | Create a permanent Evergreen note — atomic, assertion-titled, densely linked |
| `/capture` | Quick capture raw content to Inbox for later processing |
| `/daily` | Add tasks / wins / learnings / problems to today's daily note |
| `/process` | Systematically clear Inbox and promote fleeting notes |
| `/weekly-review` | End-of-week vault maintenance and health check |
| `/debug-vault` | Diagnose and fix vault problems (broken links, missing frontmatter, etc.) |
| `/new-skill` | Create a new slash command using TDD methodology |

### Key behaviors built into every command

- **Smart Routing**: if you pick the wrong command for your input, the AI explains why and suggests a better one
- **Ordered checklist**: steps must be completed in sequence — no skipping
- **Verification gate**: AI cannot claim "done" without evidence the file was actually created correctly
- **Terminal state**: every command has an explicit "what happens next"

---

## Requirements

- [Obsidian](https://obsidian.md) 1.7.2+
- [Claudian plugin](https://github.com/YishenTu/claudian) (the AI agent that powers these commands)
- Recommended: Templater, Dataview, Tasks, QuickAdd, Omnisearch plugins

---

## Installation

### macOS / Linux

```bash
git clone https://github.com/YOUR_USERNAME/obsidian-vault-superpowers
cd obsidian-vault-superpowers
chmod +x install.sh
./install.sh /path/to/your/obsidian/vault
```

### Windows (PowerShell)

```powershell
git clone https://github.com/YOUR_USERNAME/obsidian-vault-superpowers
cd obsidian-vault-superpowers
.\install.ps1 "C:\path\to\your\obsidian\vault"
```

The installer will:
1. Copy all slash commands to `.claude/commands/` in your vault *(always)*
2. Set up `.claude/settings.json` with vault-specific permissions *(if not exists)*
3. Optionally install vault templates: `AGENTS.md`, `Systems/`, `Templates/` *(asks before installing)*

---

## Quick Start

After installing, restart Claudian in Obsidian and try:

```
/brainstorm [any topic you want to understand better]
```

The AI will guide you through exploration → insight extraction → note creation.

---

## Philosophy

This framework is built on three pillars:

**1. Note-taking as a skill, not just a habit**
Each command is a structured protocol — not a simple prompt. Like TDD in coding, having a defined process produces better outcomes than ad-hoc note-taking.

**2. Evergreen > Fleeting**
The goal is to produce [Evergreen Notes](https://notes.andymatuschak.org/Evergreen_notes) — atomic, assertion-titled notes that stay valuable over time. The pipeline: `fleeting → literature → evergreen`.

**3. Verification over assertion**
AI never claims a note was "created" without actually verifying the file exists with correct content. No more phantom notes.

---

## Vault Structure (recommended)

```
YourVault/
├── .claude/
│   ├── commands/       ← slash commands (installed here)
│   └── settings.json
├── 00 Inbox/           ← quick capture, process daily
├── Daily/              ← YYYY-MM-DD.md
├── Knowledge/          ← atomic notes
│   └── _meta/          ← MOCs (Map of Content)
├── Projects/           ← PARA: Projects
├── Areas/              ← PARA: Areas
├── Resources/          ← PARA: Resources
├── Systems/            ← workflows, methodology
│   ├── Specs/          ← brainstorm/plan artifacts
│   └── Prompt Library/ ← reusable prompts
├── Templates/          ← Templater templates
└── AGENTS.md           ← AI conventions (customize this!)
```

---

## Customization

### Personalizing AGENTS.md

After installing, open `AGENTS.md` and replace:
- `YOUR_NAME` → your name
- `YOUR_EMAIL` → your email
- Update `domain/` taxonomy to match your interests

### Adding custom commands

```
/new-skill
```

This command walks you through creating a new slash command using TDD — define a test case first, then write the minimal skill to pass it.

---

## How slash commands work

Commands are plain `.md` files in `.claude/commands/`. The filename is the command name. `$ARGUMENTS` is replaced with whatever you type after the command.

```
/note JWT stateless means no built-in revocation
   ↓
Reads: .claude/commands/note.md
Replaces: $ARGUMENTS = "JWT stateless means no built-in revocation"
Sends: full note.md content as prompt to Claude
```

To edit a command's behavior — just edit the `.md` file.

---

## Acknowledgements

- [Superpowers](https://github.com/obra/superpowers) by @obra — the coding agent skills framework that inspired this
- [Andy Matuschak](https://notes.andymatuschak.org) — Evergreen Notes methodology
- [Claudian](https://github.com/YishenTu/claudian) by Yishen Tu — the Obsidian plugin that makes this possible
- PARA method by Tiago Forte

---

## License

MIT

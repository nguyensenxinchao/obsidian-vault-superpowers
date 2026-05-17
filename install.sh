#!/usr/bin/env bash
# Obsidian Vault Superpowers — Install Script (macOS / Linux)
# Usage: ./install.sh /path/to/your/obsidian/vault

set -e

RED='\033[0;31m'; YELLOW='\033[1;33m'; GREEN='\033[0;32m'; NC='\033[0m'
info()    { echo -e "${GREEN}✓${NC} $1"; }
warn()    { echo -e "${YELLOW}⚠${NC} $1"; }
error()   { echo -e "${RED}✗ Error:${NC} $1"; exit 1; }

VAULT_PATH="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Validate ──────────────────────────────────────────────────────────────────
[ -z "$VAULT_PATH" ] && error "Usage: ./install.sh /path/to/vault"
[ ! -d "$VAULT_PATH" ] && error "Vault path '$VAULT_PATH' does not exist"

echo ""
echo "  Obsidian Vault Superpowers"
echo "  Installing to: $VAULT_PATH"
echo "────────────────────────────────────────"

# ── Step 1: Slash commands (.claude/commands/) ─────────────────────────────
mkdir -p "$VAULT_PATH/.claude/commands"

EXISTING=$(ls "$VAULT_PATH/.claude/commands/"*.md 2>/dev/null | wc -l || echo 0)
if [ "$EXISTING" -gt 0 ]; then
  warn ".claude/commands/ already has $EXISTING file(s) — they will be overwritten"
  read -p "  Continue? [y/N] " -n 1 -r; echo ""
  [[ ! $REPLY =~ ^[Yy]$ ]] && echo "Aborted." && exit 0
fi

cp "$SCRIPT_DIR/.claude/commands/"*.md "$VAULT_PATH/.claude/commands/"
info "Slash commands installed ($(ls "$SCRIPT_DIR/.claude/commands/"*.md | wc -l | tr -d ' ') commands)"

# ── Step 2: settings.json ──────────────────────────────────────────────────
if [ -f "$VAULT_PATH/.claude/settings.json" ]; then
  warn ".claude/settings.json already exists — skipping (merge manually if needed)"
else
  cp "$SCRIPT_DIR/.claude/settings.json" "$VAULT_PATH/.claude/settings.json"
  info "settings.json installed"
fi

# ── Step 3: Vault templates (optional) ────────────────────────────────────
echo ""
echo "Optional: Install vault templates"
echo "  Includes: AGENTS.md, Systems/, Templates/ (note templates)"
echo "  ⚠ Will NOT overwrite existing files with same name"
read -p "Install vault templates? [y/N] " -n 1 -r; echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
  # AGENTS.md
  if [ -f "$VAULT_PATH/AGENTS.md" ]; then
    warn "AGENTS.md already exists — skipping"
  else
    cp "$SCRIPT_DIR/vault-templates/AGENTS.md" "$VAULT_PATH/AGENTS.md"
    info "AGENTS.md installed"
  fi

  # Systems/
  mkdir -p "$VAULT_PATH/Systems/Specs"
  mkdir -p "$VAULT_PATH/Systems/Prompt Library"

  for f in "$SCRIPT_DIR/vault-templates/Systems/"*.md; do
    fname=$(basename "$f")
    if [ ! -f "$VAULT_PATH/Systems/$fname" ]; then
      cp "$f" "$VAULT_PATH/Systems/$fname"
      info "Systems/$fname"
    else
      warn "Systems/$fname already exists — skipping"
    fi
  done

  for f in "$SCRIPT_DIR/vault-templates/Systems/Prompt Library/"*.md; do
    fname=$(basename "$f")
    if [ ! -f "$VAULT_PATH/Systems/Prompt Library/$fname" ]; then
      cp "$f" "$VAULT_PATH/Systems/Prompt Library/$fname"
      info "Systems/Prompt Library/$fname"
    fi
  done

  cp "$SCRIPT_DIR/vault-templates/Systems/Specs/README.md" \
     "$VAULT_PATH/Systems/Specs/README.md" 2>/dev/null || true

  # Templates/
  mkdir -p "$VAULT_PATH/Templates"
  for f in "$SCRIPT_DIR/vault-templates/Templates/"*.md; do
    fname=$(basename "$f")
    if [ ! -f "$VAULT_PATH/Templates/$fname" ]; then
      cp "$f" "$VAULT_PATH/Templates/$fname"
      info "Templates/$fname"
    else
      warn "Templates/$fname already exists — skipping"
    fi
  done
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "────────────────────────────────────────"
echo -e "${GREEN}✅ Done!${NC}"
echo ""
echo "Next steps:"
echo "  1. Open Obsidian and restart Claudian plugin"
echo "  2. Edit AGENTS.md — replace YOUR_NAME and YOUR_EMAIL"
echo "  3. Try: /brainstorm <your first topic>"
echo ""
echo "Available commands:"
echo "  /brainstorm  /plan  /note  /evergreen  /capture"
echo "  /daily  /process  /weekly-review  /debug-vault  /new-skill"
echo ""

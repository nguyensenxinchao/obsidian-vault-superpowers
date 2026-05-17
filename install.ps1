# Obsidian Vault Superpowers — Install Script (Windows PowerShell)
# Usage: .\install.ps1 -VaultPath "C:\path\to\your\vault"
#    or: .\install.ps1 "C:\path\to\your\vault"

param(
  [Parameter(Mandatory=$true, Position=0)]
  [string]$VaultPath
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Info  { param($msg) Write-Host "  [OK] $msg" -ForegroundColor Green }
function Warn  { param($msg) Write-Host "  [!!] $msg" -ForegroundColor Yellow }
function Abort { param($msg) Write-Host "  [XX] $msg" -ForegroundColor Red; exit 1 }

# ── Validate ──────────────────────────────────────────────────────────────────
if (-not (Test-Path $VaultPath)) { Abort "Vault path '$VaultPath' does not exist" }

Write-Host ""
Write-Host "  Obsidian Vault Superpowers" -ForegroundColor Cyan
Write-Host "  Installing to: $VaultPath"
Write-Host "────────────────────────────────────────"

# ── Step 1: Slash commands ─────────────────────────────────────────────────
$cmdDest = "$VaultPath\.claude\commands"
New-Item -ItemType Directory -Force -Path $cmdDest | Out-Null

$existing = (Get-ChildItem "$cmdDest\*.md" -ErrorAction SilentlyContinue | Measure-Object).Count
if ($existing -gt 0) {
  Warn ".claude\commands\ already has $existing file(s) — they will be overwritten"
  $reply = Read-Host "  Continue? [y/N]"
  if ($reply -notmatch '^[Yy]$') { Write-Host "Aborted."; exit 0 }
}

Copy-Item "$ScriptDir\.claude\commands\*.md" $cmdDest -Force
$count = (Get-ChildItem "$ScriptDir\.claude\commands\*.md" | Measure-Object).Count
Info "Slash commands installed ($count commands)"

# ── Step 2: settings.json ──────────────────────────────────────────────────
$settingsDest = "$VaultPath\.claude\settings.json"
if (Test-Path $settingsDest) {
  Warn ".claude\settings.json already exists — skipping (merge manually if needed)"
} else {
  Copy-Item "$ScriptDir\.claude\settings.json" $settingsDest
  Info "settings.json installed"
}

# ── Step 3: Vault templates (optional) ────────────────────────────────────
Write-Host ""
Write-Host "Optional: Install vault templates"
Write-Host "  Includes: AGENTS.md, Systems\, Templates\ (note templates)"
Write-Host "  [Note] Will NOT overwrite existing files with same name"
$reply = Read-Host "Install vault templates? [y/N]"

if ($reply -match '^[Yy]$') {
  # AGENTS.md
  $agentsDest = "$VaultPath\AGENTS.md"
  if (Test-Path $agentsDest) {
    Warn "AGENTS.md already exists — skipping"
  } else {
    Copy-Item "$ScriptDir\vault-templates\AGENTS.md" $agentsDest
    Info "AGENTS.md installed"
  }

  # Systems/
  @("$VaultPath\Systems", "$VaultPath\Systems\Specs", "$VaultPath\Systems\Prompt Library") |
    ForEach-Object { New-Item -ItemType Directory -Force -Path $_ | Out-Null }

  Get-ChildItem "$ScriptDir\vault-templates\Systems\*.md" | ForEach-Object {
    $dest = "$VaultPath\Systems\$($_.Name)"
    if (-not (Test-Path $dest)) { Copy-Item $_.FullName $dest; Info "Systems\$($_.Name)" }
    else { Warn "Systems\$($_.Name) already exists — skipping" }
  }

  Get-ChildItem "$ScriptDir\vault-templates\Systems\Prompt Library\*.md" | ForEach-Object {
    $dest = "$VaultPath\Systems\Prompt Library\$($_.Name)"
    if (-not (Test-Path $dest)) { Copy-Item $_.FullName $dest; Info "Systems\Prompt Library\$($_.Name)" }
  }

  $specsReadme = "$ScriptDir\vault-templates\Systems\Specs\README.md"
  if (Test-Path $specsReadme) {
    Copy-Item $specsReadme "$VaultPath\Systems\Specs\README.md" -Force
  }

  # Templates/
  New-Item -ItemType Directory -Force -Path "$VaultPath\Templates" | Out-Null
  Get-ChildItem "$ScriptDir\vault-templates\Templates\*.md" | ForEach-Object {
    $dest = "$VaultPath\Templates\$($_.Name)"
    if (-not (Test-Path $dest)) { Copy-Item $_.FullName $dest; Info "Templates\$($_.Name)" }
    else { Warn "Templates\$($_.Name) already exists — skipping" }
  }
}

# ── Done ──────────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "────────────────────────────────────────"
Write-Host "  Done!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open Obsidian and restart the Claudian plugin"
Write-Host "  2. Edit AGENTS.md — replace YOUR_NAME and YOUR_EMAIL"
Write-Host "  3. Try: /brainstorm <your first topic>"
Write-Host ""
Write-Host "Available commands:"
Write-Host "  /brainstorm  /plan  /note  /evergreen  /capture"
Write-Host "  /daily  /process  /weekly-review  /debug-vault  /new-skill"
Write-Host ""

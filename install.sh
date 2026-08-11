#!/usr/bin/env sh
# One Punch Skill — installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/dekan-aleksandr/one-punch-skill/main/install.sh | sh
# Installs the `push` skill into ~/.claude/skills/push/SKILL.md (override with SKILLS_DIR=...)
set -eu

SKILLS_DIR="${SKILLS_DIR:-$HOME/.claude/skills}"
DEST="$SKILLS_DIR/push"
SRC="https://raw.githubusercontent.com/dekan-aleksandr/one-punch-skill/main/skills/push/SKILL.md"

mkdir -p "$DEST"

if [ -f "./skills/push/SKILL.md" ]; then
  cp "./skills/push/SKILL.md" "$DEST/SKILL.md"
elif command -v curl >/dev/null 2>&1; then
  curl -fsSL "$SRC" -o "$DEST/SKILL.md"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$DEST/SKILL.md" "$SRC"
else
  echo "need curl or wget" >&2; exit 1
fi

echo "Installed: $DEST/SKILL.md"
echo "Use it with /push, or let the agent invoke it when stuck."

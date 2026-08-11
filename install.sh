#!/usr/bin/env sh
# One Punch Skill — installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/dekan-aleksandr/one-punch-skill/main/install.sh | sh
# Installs the skills into ~/.claude/skills/ (override with SKILLS_DIR=...)
set -eu

SKILLS_DIR="${SKILLS_DIR:-$HOME/.claude/skills}"
BASE="https://raw.githubusercontent.com/dekan-aleksandr/one-punch-skill/main/skills"

fetch() { # fetch <url> <dest>
  if command -v curl >/dev/null 2>&1; then curl -fsSL "$1" -o "$2"
  elif command -v wget >/dev/null 2>&1; then wget -qO "$2" "$1"
  else echo "need curl or wget" >&2; exit 1
  fi
}

for skill in push one-punch-bugs; do
  dest="$SKILLS_DIR/$skill"
  mkdir -p "$dest"
  if [ -f "./skills/$skill/SKILL.md" ]; then
    cp "./skills/$skill/SKILL.md" "$dest/SKILL.md"
  else
    fetch "$BASE/$skill/SKILL.md" "$dest/SKILL.md"
  fi
  echo "Installed: $dest/SKILL.md"
done

echo "Use /push or /one-punch-bugs, or let the agent invoke them when stuck."

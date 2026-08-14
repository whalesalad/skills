#!/usr/bin/env bash
set -euo pipefail

# Copy the reviewed skill directories from this repository into a coding
# agent's global skills directory.
#
# Claude Code users can instead install this repository as a plugin and skip
# this script entirely. See README.md.

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_root="${repo_root}/skills"

codex_home="${CODEX_HOME:-${HOME}/.codex}"
claude_home="${CLAUDE_CONFIG_DIR:-${HOME}/.claude}"

usage() {
  cat <<'EOF'
usage: install.sh [--codex] [--claude] [--all]

  (no flags)  install into every agent home that already exists
  --codex     install into ${CODEX_HOME:-~/.codex}/skills
  --claude    install into ${CLAUDE_CONFIG_DIR:-~/.claude}/skills
  --all       install into both

An explicit flag creates the target directory if it is missing. Running with no
flags never creates a home for an agent that is not installed.
EOF
}

want_codex=0
want_claude=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --codex) want_codex=1 ;;
    --claude) want_claude=1 ;;
    --all) want_codex=1; want_claude=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "error: unknown argument $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

if [[ ${want_codex} -eq 0 && ${want_claude} -eq 0 ]]; then
  [[ -d "${codex_home}" ]] && want_codex=1
  [[ -d "${claude_home}" ]] && want_claude=1

  if [[ ${want_codex} -eq 0 && ${want_claude} -eq 0 ]]; then
    echo "error: found neither ${codex_home} nor ${claude_home}" >&2
    echo "hint: pass --codex, --claude, or --all to create one" >&2
    exit 1
  fi
fi

command -v rsync >/dev/null 2>&1 || {
  echo "error: rsync is required" >&2
  exit 1
}

# Discover skills from the repository rather than a hardcoded list, so adding a
# skill directory is the only step needed.
skills=()
for skill_dir in "${source_root}"/*/; do
  if [[ ! -f "${skill_dir}SKILL.md" ]]; then
    echo "error: ${skill_dir}SKILL.md is missing" >&2
    exit 1
  fi
  skills+=("$(basename "${skill_dir}")")
done

if [[ ${#skills[@]} -eq 0 ]]; then
  echo "error: no skills found under ${source_root}" >&2
  exit 1
fi

install_into() {
  local agent="$1"
  local destination_root="$2"
  local skill source_dir destination_dir

  mkdir -p "${destination_root}"

  for skill in "${skills[@]}"; do
    source_dir="${source_root}/${skill}"
    destination_dir="${destination_root}/${skill}"

    if [[ -L "${destination_dir}" ]]; then
      echo "error: refusing to replace symlink ${destination_dir}" >&2
      exit 1
    fi

    if [[ -e "${destination_dir}" && ! -f "${destination_dir}/SKILL.md" ]]; then
      echo "error: refusing to replace unmanaged path ${destination_dir}" >&2
      exit 1
    fi

    mkdir -p "${destination_dir}"
    rsync -a --delete "${source_dir}/" "${destination_dir}/"
    echo "installed ${skill} -> ${destination_dir} (${agent})"
  done
}

[[ ${want_codex} -eq 1 ]] && install_into codex "${codex_home}/skills"
[[ ${want_claude} -eq 1 ]] && install_into claude "${claude_home}/skills"

exit 0

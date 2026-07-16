#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
codex_home="${CODEX_HOME:-${HOME}/.codex}"
destination_root="${codex_home}/skills"

skills=(
  track-project-journal
  manage-project-todo
  bootstrap-resumable-project
)

command -v rsync >/dev/null 2>&1 || {
  echo "error: rsync is required" >&2
  exit 1
}

mkdir -p "${destination_root}"

for skill in "${skills[@]}"; do
  source_dir="${repo_root}/${skill}"
  destination_dir="${destination_root}/${skill}"

  if [[ ! -f "${source_dir}/SKILL.md" ]]; then
    echo "error: missing ${source_dir}/SKILL.md" >&2
    exit 1
  fi

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
  echo "installed ${skill} -> ${destination_dir}"
done

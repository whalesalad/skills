#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
codex_home="${CODEX_HOME:-${HOME}/.codex}"
validator="${codex_home}/skills/.system/skill-creator/scripts/quick_validate.py"

skills=(
  track-project-journal
  manage-project-todo
  bootstrap-resumable-project
)

if [[ ! -f "${validator}" ]]; then
  echo "error: skill validator not found at ${validator}" >&2
  exit 1
fi

for skill in "${skills[@]}"; do
  python3 "${validator}" "${repo_root}/${skill}"
done

if grep -R -n -E '\[TODO|\[TBD|FIXME' \
  "${repo_root}/track-project-journal" \
  "${repo_root}/manage-project-todo" \
  "${repo_root}/bootstrap-resumable-project"; then
  echo "error: generated placeholder remains in a skill" >&2
  exit 1
fi

if grep -R -n -E '/home/[^/]+|192\.168\.[0-9]+\.[0-9]+|10\.[0-9]+\.[0-9]+\.[0-9]+' \
  --exclude-dir=.git --exclude=check.sh "${repo_root}"; then
  echo "error: possible private path or network identifier found" >&2
  exit 1
fi

git -C "${repo_root}" diff --check
bash -n "${repo_root}/scripts/install.sh" "${repo_root}/scripts/check.sh"

echo "all checks passed"

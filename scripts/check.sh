#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_root="${repo_root}/skills"
codex_home="${CODEX_HOME:-${HOME}/.codex}"
codex_validator="${codex_home}/skills/.system/skill-creator/scripts/quick_validate.py"

# Portable structural validation: frontmatter, naming, size, Codex UI metadata,
# and the Claude Code plugin manifests.
python3 "${repo_root}/scripts/validate_skills.py"

# Codex's own validator when it is available locally. Absence is not a failure,
# so contributors who only run Claude Code can still validate the repository.
if [[ -f "${codex_validator}" ]]; then
  for skill_dir in "${source_root}"/*/; do
    python3 "${codex_validator}" "${skill_dir%/}"
  done
else
  echo "note: Codex validator not found at ${codex_validator}; skipped"
fi

if grep -R -n -E '\[TODO|\[TBD|FIXME' "${source_root}"; then
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

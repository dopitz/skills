#!/usr/bin/env bash
#
# Install the skills in this repository as symlinks.
#
#   ./install.sh            # link into ~/.agents/skills
#   ./install.sh -claude    # additionally link into ~/.claude/skills
#
# Claude Code does not look inside ~/.agents/skills, hence the -claude flag.

set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGETS=("$HOME/.agents/skills")
FORCE=0
DRY_RUN=0

usage() {
    cat <<'USAGE'
Usage: install.sh [options]

Options:
  -claude, --claude   Also symlink the skills into ~/.claude/skills
  -f, --force         Replace existing files/directories at the target paths
  -n, --dry-run       Show what would happen without changing anything
  -h, --help          Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -claude|--claude) TARGETS+=("$HOME/.claude/skills") ;;
        -f|--force)       FORCE=1 ;;
        -n|--dry-run)     DRY_RUN=1 ;;
        -h|--help)        usage; exit 0 ;;
        *) echo "Unknown option: $1" >&2; usage >&2; exit 1 ;;
    esac
    shift
done

run() {
    if [[ $DRY_RUN -eq 1 ]]; then
        echo "  [dry-run] $*"
    else
        "$@"
    fi
}

# Collect every directory that contains a SKILL.md.
skills=()
for skill_file in "$SRC_DIR"/*/SKILL.md; do
    [[ -e "$skill_file" ]] || continue
    skills+=("$(dirname "$skill_file")")
done

if [[ ${#skills[@]} -eq 0 ]]; then
    echo "No skills (directories containing SKILL.md) found in $SRC_DIR" >&2
    exit 1
fi

for target_dir in "${TARGETS[@]}"; do
    echo "Installing ${#skills[@]} skills into $target_dir"
    run mkdir -p "$target_dir"

    for skill_path in "${skills[@]}"; do
        name="$(basename "$skill_path")"
        link="$target_dir/$name"

        if [[ -L "$link" ]]; then
            current="$(readlink "$link")"
            if [[ "$current" == "$skill_path" ]]; then
                echo "  = $name (already linked)"
                continue
            fi
            echo "  ~ $name (relinking from $current)"
            run rm "$link"
        elif [[ -e "$link" ]]; then
            if [[ $FORCE -eq 1 ]]; then
                echo "  ! $name (replacing existing path)"
                run rm -rf "$link"
            else
                echo "  x $name skipped: $link exists and is not a symlink (use --force)" >&2
                continue
            fi
        else
            echo "  + $name"
        fi

        run ln -s "$skill_path" "$link"
    done
done

echo "Done."

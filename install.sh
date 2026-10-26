#!/usr/bin/env bash
#
# Install or uninstall symlinks for the skills in this repository.
#
#   ./install.sh                         # link all skills into ~/.agents/skills
#   ./install.sh -claude                 # additionally link into ~/.claude/skills
#   ./install.sh --uninstall code-review # remove the installed code-review link
#
# Claude Code does not look inside ~/.agents/skills, hence the -claude flag.

set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGETS=("$HOME/.agents/skills")
FORCE=0
DRY_RUN=0
UNINSTALL=0
skill_names=()

usage() {
    cat <<'USAGE'
Usage: install.sh [options] [skill ...]

Install all skills, or only the named skills. Uninstall requires skill names.

Options:
  -claude, --claude   Also manage links in ~/.claude/skills
  -u, --uninstall     Remove named skills' links pointing to this repository
  -f, --force         Replace existing files/directories when installing
  -n, --dry-run       Show what would happen without changing anything
  -h, --help          Show this help

Examples:
  ./install.sh --uninstall code-review
  ./install.sh --uninstall --claude --dry-run code-review handoff
USAGE
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -claude|--claude) TARGETS+=("$HOME/.claude/skills") ;;
        -u|--uninstall)   UNINSTALL=1 ;;
        -f|--force)       FORCE=1 ;;
        -n|--dry-run)     DRY_RUN=1 ;;
        -h|--help)        usage; exit 0 ;;
        --) shift; skill_names+=("$@"); break ;;
        -*) echo "Unknown option: $1" >&2; usage >&2; exit 1 ;;
        *) skill_names+=("$1") ;;
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

# Resolve named skills, or collect every directory that contains a SKILL.md.
# Uninstall accepts missing source directories so stale links can be removed.
skills=()
if [[ ${#skill_names[@]} -gt 0 ]]; then
    for name in "${skill_names[@]}"; do
        if [[ -z "$name" || "$name" == . || "$name" == .. || "$name" == */* ]]; then
            echo "Invalid skill name: $name (use a directory name, not a path)" >&2
            exit 1
        fi
        skill_path="$SRC_DIR/$name"
        if [[ $UNINSTALL -eq 0 && ! -f "$skill_path/SKILL.md" ]]; then
            echo "Skill not found: $name (no SKILL.md in $skill_path)" >&2
            exit 1
        fi
        skills+=("$skill_path")
    done
elif [[ $UNINSTALL -eq 1 ]]; then
    echo "Uninstall requires at least one skill name." >&2
    usage >&2
    exit 1
else
    for skill_file in "$SRC_DIR"/*/SKILL.md; do
        [[ -e "$skill_file" ]] || continue
        skills+=("$(dirname "$skill_file")")
    done
fi

if [[ ${#skills[@]} -eq 0 ]]; then
    echo "No skills (directories containing SKILL.md) found in $SRC_DIR" >&2
    exit 1
fi

for target_dir in "${TARGETS[@]}"; do
    if [[ $UNINSTALL -eq 1 ]]; then
        echo "Uninstalling ${#skills[@]} skills from $target_dir"
    else
        echo "Installing ${#skills[@]} skills into $target_dir"
        run mkdir -p "$target_dir"
    fi

    for skill_path in "${skills[@]}"; do
        name="$(basename "$skill_path")"
        link="$target_dir/$name"

        if [[ $UNINSTALL -eq 1 ]]; then
            if [[ -L "$link" && "$(readlink "$link")" == "$skill_path" ]]; then
                echo "  - $name"
                run rm -- "$link"
            elif [[ -L "$link" || -e "$link" ]]; then
                echo "  x $name skipped: $link is not a link to $skill_path" >&2
            else
                echo "  = $name (not installed)"
            fi
            continue
        fi

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

#!/bin/sh
input=$(cat)

vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
total_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')

if [ -n "$total_tokens" ]; then
    total_tokens=$(awk -v t="$total_tokens" 'BEGIN { printf "%.1f", t / 1000 }')
fi

parts=""

if [ -n "$vim_mode" ]; then
    parts=$(printf '\033[1;33m[%s]\033[0m' "$vim_mode")
fi

if [ -n "$model" ]; then
    parts="$parts$(printf ' \033[1;34m%s\033[0m' "$model")"
fi

if [ -n "$cwd" ]; then
    parts="$parts$(printf ' \033[0;36m%s\033[0m' "$cwd")"
fi

if [ -n "$used_pct" ] && [ -n "$total_tokens" ]; then
    parts="$parts$(printf ' \033[0;35mctx: %.0f%% / %s ktok\033[0m' "$used_pct" "$total_tokens")"
elif [ -n "$used_pct" ]; then
    parts="$parts$(printf ' \033[0;35mctx: %.0f%%\033[0m' "$used_pct")"
elif [ -n "$total_tokens" ]; then
    parts="$parts$(printf ' \033[0;35mctx: %s ktok\033[0m' "$total_tokens")"
fi

printf '%s' "$parts"

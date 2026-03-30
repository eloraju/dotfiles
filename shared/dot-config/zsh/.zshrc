# set vi mode
bindkey -v

setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY        # Share history between all sessions.

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q'                # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q'; } # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Source envs and aliases before trying to init anything
source ~/.config/env
source ~/.config/aliasrc

# init mac stuff only on mac
if [ "$(uname)" = "Darwin" ]; then
  source "$XDG_CONFIG_HOME/zshrc-mac"
  source "$XDG_CONFIG_HOME/env-mac"
  source "$XDG_CONFIG_HOME/aliasrc-mac"
fi


source ~/.config/zsh/npm_completion.zsh
#fzf init
source <(fzf --zsh)

eval "$(zoxide init zsh --cmd cd)"

# list files on directory change
function cd() {
  __zoxide_z "$@" && ll
}

# helper to reaload zsh config
function reload-config() {
  source ~/.config/zsh/.zshrc
}

eval "$(mise activate zsh)"

# Prompt
#eval "$(starship init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/prompt.toml)"

# compinit after everything else is setup
autoload -Uz compinit
compinit
_comp_options+=(globdots)

# Start tmux (only for interactive shells)
if [ -z "$TMUX" ] && [[ -o interactive ]]; then
  if GIT_PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null); then
    SESSION_NAME="$(basename \"$GIT_PROJECT_ROOT\" | sed 's/[^[:alnum:]-]//g')"
  else
    SESSION_NAME="main"
  fi

  tmux new-session -A -s "$SESSION_NAME"
fi

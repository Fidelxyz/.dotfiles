# Use XDG dirs for completion and history files
[ -d "$XDG_STATE_HOME/zsh" ] || mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# ========================================

[[ ! -d "$HOME/.local/bin" ]] || export PATH="$HOME/.local/bin:$PATH"

# ========================================

# Oh My Zsh
source "$ZDOTDIR/.ohmyzsh.zsh"

# Powerlevel10k
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# Scripts
type fzf >/dev/null    && source <(fzf --zsh)
type direnv >/dev/null && eval "$(direnv hook zsh)"
type zoxide >/dev/null && eval "$(zoxide init zsh)"
type gh >/dev/null     && eval "$(gh copilot alias -- zsh)"

# ========================================

[[ ! -f "$ZDOTDIR/.zshrc-local.zsh" ]] || source "$ZDOTDIR/.zshrc-local.zsh"

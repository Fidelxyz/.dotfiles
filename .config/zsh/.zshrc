export PATH="$HOME/.local/bin:$PATH"

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

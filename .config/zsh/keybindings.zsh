bindkey -e

[[ -n "${terminfo[kcbt]}" ]] && \
	bindkey -- "${terminfo[kcbt]}" reverse-menu-complete

function clear-screen-and-scrollback {
    clear && printf '\e[3J'
    zle && zle .reset-prompt && zle -R
}
zle -N clear-screen-and-scrollback
bindkey "\e[27;5;46~" clear-screen-and-scrollback

bindkey 'TAB' expand-or-complete-prefix

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# zsh-autosuggestions break these plugins without this
zstyle ':zle:up-line-or-beginning-search' leave-cursor false
zstyle ':zle:down-line-or-beginning-search' leave-cursor false

bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

bindkey ' ' magic-space                               # [Space] - don't do history expansion

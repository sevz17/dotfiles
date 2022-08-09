bindkey -e

[[ -n "${terminfo[kcbt]}" ]] && \
	bindkey -- "${terminfo[kcbt]}" reverse-menu-complete

function exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

function clear-screen-and-scrollback {
    clear && printf '\e[3J'
    zle && zle .reset-prompt && zle -R
}
zle -N clear-screen-and-scrollback
bindkey "\e[27;5;46~" clear-screen-and-scrollback

bindkey 'TAB' expand-or-complete-prefix

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

bindkey ' ' magic-space                               # [Space] - don't do history expansion

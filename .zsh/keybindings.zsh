bindkey -e

typeset -g -A key

key[Shift-Tab]="${terminfo[kcbt]}"

[[ -n "${key[Shift-Tab]}" ]] && \
	bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

function exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

bindkey 'TAB' expand-or-complete-prefix

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

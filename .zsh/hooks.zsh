autoload -Uz add-zsh-hook

function reset_broken_terminal () {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ ' && print -n -- " ${(q)1}\a"
}

add-zsh-hook -Uz precmd reset_broken_terminal

if [[ "${TERM}" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

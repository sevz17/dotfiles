export GPG_TTY=$(tty)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

WORDCHARS=${WORDCHARS/\/}
WORDCHARS=${WORDCHARS/_}

fpath+="${ZDOTDIR}/completions"

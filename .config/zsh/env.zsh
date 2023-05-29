export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

WORDCHARS=${WORDCHARS/\/}
WORDCHARS=${WORDCHARS/_}

fpath+="${ZDOTDIR}/completions"

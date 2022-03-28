HISTFILE="${HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

ZDOTDIR="${HOME}/.zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache/zsh}"
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

source "${ZINIT_HOME}/zinit.zsh"
ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay

zinit wait lucid pick'zprofile' for \
	/etc/zsh

zinit wait lucid for \
  OMZP::git \
  OMZP::sudo \
  OMZP::tmux \
  OMZP::dotnet \
  OMZP::rust

zinit wait lucid atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' for \
    hlissner/zsh-autopair

zinit wait lucid \
  multisrc'configs.zsh funcs.zsh zoxide.zsh keybindings.zsh hooks.zsh completions.zsh' \
  for ${ZDOTDIR}

zinit ice wait lucid reset-prompt atload'!prompt_starship_precmd; prompt_starship_preexec'
zinit snippet "${ZDOTDIR}"/starship.zsh

zinit wait lucid atinit'!ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' for \
    z-shell/fast-syntax-highlighting \
  atload'!_zsh_autosuggest_start' pick'zsh-autosuggestions.zsh' \
    /usr/share/zsh/site-functions

# Set personal aliases
# For a full list of active aliases, run `alias`.
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

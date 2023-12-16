export HISTFILE="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/history"
export HISTSIZE=50000
export SAVEHIST=${HISTSIZE}

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

source "${ZINIT_HOME}/zinit.zsh"
ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay

zinit wait lucid for \
  OMZP::git \
  atload'!bindkey "^[s" sudo-command-line' OMZP::sudo \
  OMZP::rust
#  OMZP::tmux \
#  OMZP::dotnet

zinit wait lucid atload'!ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' for \
    hlissner/zsh-autopair

zinit wait lucid \
  multisrc'aliases.zsh configs.zsh funcs.zsh zoxide.zsh keybindings.zsh hooks.zsh completions.zsh' \
  for ${ZDOTDIR}

zinit wait'!0' lucid is-snippet for \
  "${ZDOTDIR}"/starship.zsh

if command -v emerge >/dev/null 2>&1; then
  zinit wait lucid atinit'!ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' for \
        z-shell/fast-syntax-highlighting \
        atload'!_zsh_autosuggest_start' pick'zsh-autosuggestions.zsh' \
        /usr/share/zsh/site-functions
else
  zinit wait lucid atinit'!ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' for \
        z-shell/fast-syntax-highlighting \
        atload'!_zsh_autosuggest_start' pick'zsh-autosuggestions.zsh' \
        /usr/share/zsh/plugins/zsh-autosuggestions
fi

GPG_TTY=$(tty)
export GPG_TTY

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  export SSH_AUTH_SOCK
fi

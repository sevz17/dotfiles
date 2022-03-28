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

zinit wait lucid atload'!ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' for \
    hlissner/zsh-autopair

zinit wait lucid \
  multisrc'configs.zsh env.zsh funcs.zsh zoxide.zsh keybindings.zsh hooks.zsh completions.zsh' \
  for ${ZDOTDIR}

zinit ice wait lucid reset-prompt atload'!prompt_starship_precmd; prompt_starship_preexec'
zinit snippet "${ZDOTDIR}"/starship.zsh

zinit wait lucid atinit'!ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' for \
    z-shell/fast-syntax-highlighting \
  atload'!_zsh_autosuggest_start' pick'zsh-autosuggestions.zsh' \
    /usr/share/zsh/site-functions

zinit wait lucid pick'.aliases' for "${HOME}"

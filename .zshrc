# Path to your oh-my-zsh installation.
ZSH=/usr/share/zsh/site-contrib/oh-my-zsh/

# Use hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Change the command execution time stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# Or set a custom format using the strftime function format specifications,
HIST_STAMPS="%d/%m/%Y"

ZSH_CACHE_DIR=$HOME/.cache/zsh

# Which plugins would you like to load?
# Add wisely, as too many plugins slow down shell startup.
plugins=(cargo dotnet git sudo zsh-autopair fast-syntax-highlighting zsh_reload )

source /etc/profile
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/site-contrib/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/site-contrib/zsh-silver/silver.plugin.zsh

# User configuration
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' use-cache 1
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//,/ }
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'
# Highlight matching part of available completions
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %P Lines: %m
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Set personal aliases, overriding those provided by oh-my-zsh
# For a full list of active aliases, run `alias`.
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

function get_resume_offset() {
  echo $(($(sudo btrfs_map_physical /swapfile | awk '{ if ( NR == 2) { print $9; exit 0 } }')/$(getconf PAGESIZE)))
}

exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

# complete . and .. special directories
zstyle ':completion:*' special-dirs true

# don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Prevent CVS files/directories from being completed:
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# ... unless we really want to.
zstyle '*' single-ignored show

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~  ' && print -n -- " ${(q)1}\a"
}

if [[ "${TERM}" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

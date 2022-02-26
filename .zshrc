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
plugins=( git sudo tmux zsh-autopair fast-syntax-highlighting )

source /etc/profile
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh


# Set personal aliases, overriding those provided by oh-my-zsh
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

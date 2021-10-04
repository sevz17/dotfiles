# Path to your oh-my-zsh installation.
ZSH=/usr/share/zsh/site-contrib/oh-my-zsh/

autoload -Uz compinit
compinit

source $ZSH/plugins/tmux/tmux.plugin.zsh

ZSH_TMUX_AUTOSTART_ONCE="false"
ZSH_TMUX_AUTOSTART="true"

if [ -z "${TMUX}" ] && [ "$(tty)" != "/dev/tty2" ]; then
  tmux
fi

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

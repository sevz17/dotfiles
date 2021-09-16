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

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="%d/%m/%Y"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

function get_resume_offset() {
  echo $(($(sudo btrfs_map_physical /swapfile | awk '{ if ( NR == 2) { print $9; exit 0 } }')/$(getconf PAGESIZE)))
}


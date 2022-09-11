if status is-interactive
    source (/usr/bin/starship init fish --print-full-init | psub)
    zoxide init fish | source

    set -xg GPG_TTY $(tty)
end

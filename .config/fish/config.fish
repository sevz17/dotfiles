if status is-interactive
    source (/usr/bin/starship init fish --print-full-init | psub)
    zoxide init fish | source
end

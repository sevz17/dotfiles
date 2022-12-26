if status is-interactive
    source (/usr/bin/starship init fish --print-full-init | psub)
    zoxide init fish | source

    set -xg GPG_TTY $(tty)

    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
end

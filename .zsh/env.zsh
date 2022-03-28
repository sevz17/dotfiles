unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export CLANGD_FLAGS="--all-scopes-completion -j=5 --clang-tidy --completion-parse=always --include-ineligible-results --malloc-trim --pch-storage=disk --header-insertion=iwyu --header-insertion-decorators --inlay-hints --background-index --completion-style=detailed"

fpath+="${ZDOTDIR}/completions"

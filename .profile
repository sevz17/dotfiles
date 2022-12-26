export XKB_DEFAULT_LAYOUT="latam,latam,us"
export XKB_DEFAULT_VARIANT="dvorak,,"
export XKB_DEFAULT_OPTIONS="grp:win_space_toggle,keypad:pointerkeys,terminate:ctrl_alt_bksp"

export GOPROXY=direct
export GOSUMDB=off
export GOPATH="${XDG_DATA_HOME:-${HOME}/.local/share}"/go

export CARGO_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"/cargo

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}"/pass

export ENV="${HOME}/.dashrc"

export TERMINAL=footclient

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export CLANGD_FLAGS="-j=9 --clang-tidy --completion-parse=always --include-ineligible-results --malloc-trim --pch-storage=memory --header-insertion=never --background-index --completion-style=detailed"

export PATH="${XDG_CONFIG_HOME:-${HOME}/.config}/emacs/bin/:$PATH"

export CHROMIUM_USER_FLAGS="\
  --enable-features=ZeroCopy,VaapiVideoEncoder,VaapiVideoDecoder,WebUIDarkMode,WebRTCPipeWireCapturer,CanvasOopRasterization,EnableDrDc,SystemNotifications,PlatformHEVCDecoderSupport \
  --enable-gpu-memory-buffer-video-frames \
  --enable-gpu-compositing --ignore-gpu-blocklist \
  --ignore-gpu-blocklist --enable-gpu-rasterization \
  --enable-oop-rasterization --enable-zero-copy \
  --smooth-scrolling --force-dark-mode \
  --disk-cache-dir=/tmp/chromium-cache"
export CHROMIUM_BIN_USER_FLAGS="--user-data-dir=${HOME}/.config/chromium ${CHROMIUM_FLAGS}"

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  export SSH_AUTH_SOCK
fi

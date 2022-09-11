export XCURSOR_THEME=breeze_cursors
export XCURSOR_SIZE=24
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

export CHROMIUM_USER_FLAGS="\
  --enable-features=ZeroCopy,VaapiVideoEncoder,VaapiVideoDecoder,WebUIDarkMode,WebRTCPipeWireCapturer,CanvasOopRasterization,EnableDrDc,SystemNotifications \
  --enable-gpu-memory-buffer-video-frames \
  --enable-gpu-compositing --ignore-gpu-blocklist \
  --ignore-gpu-blocklist --enable-gpu-rasterization \
  --enable-oop-rasterization --enable-zero-copy \
  --smooth-scrolling --force-dark-mode \
  --disk-cache-dir=/tmp/chromium-cache"
export CHROMIUM_BIN_USER_FLAGS="--user-data-dir=${HOME}/.config/chromium ${CHROMIUM_FLAGS}"

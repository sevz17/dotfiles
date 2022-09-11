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

export CHROMIUM_FLAGS="--enable-features=Vulkan,VaapiVideoDecoder,UseOzonePlatform,WebUIDarkMode \
  --ozone-platform-hint=auto --enable-gpu-memory-buffer-video-frames \
  --enable-gpu-compositing --ignore-gpu-blocklist --enable-accelerated-video-decode \
  --enable-webrtc-pipewire-capturer --ignore-gpu-blocklist --enable-gpu-rasterization \
  --enable-oop-rasterization --canvas-oop-rasterization --enable-zero-copy \
  --smooth-scrolling --enable-drdc --enable-raw-draw --force-dark-mode"
export CHROMIUM_BIN_FLAGS="--user-data-dir=${HOME}/.config/chromium ${CHROMIUM_FLAGS}"

export XKB_DEFAULT_LAYOUT="latam,latam,us"
export XKB_DEFAULT_VARIANT=",dvorak,"
export XKB_DEFAULT_OPTIONS="grp:win_space_toggle,ctrl:nocaps,grp_led:scroll,keypad:pointerkeys,terminate:ctrl_alt_bksp"

export GOPROXY=direct
export GOSUMDB=off
export GOPATH="${XDG_DATA_HOME:-${HOME}/.local/share}"/go

export CARGO_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"/cargo

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}"/pass

export TERMINAL=footclient

export EMAIL="leohdz172@proton.me"

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

export CC=gcc
export CXX=g++
export CFLAGS="-march=native -Og -pipe -flto=auto -Werror=odr -Werror=strict-aliasing -Werror=lto-type-mismatch -g3 -ggdb3"
export CXXFLAGS="${CFLAGS}"
export LDFLAGS="-Wl,-O1 -Wl,--as-needed -Wl,-O2 -fuse-ld=mold -Wl,--threads=$(nproc)"
export RUSTFLAGS="-C target-cpu=native -C opt-level=3 -C codegen-units=1 -C linker=clang -C link-arg=-fuse-ld=mold -C embed-bitcode=yes -C lto=thin -C linker-plugin-lto -C link-arg=-march=native -C link-arg=-flto=thin -C link-arg=-flto-jobs=8 -C link-arg=-Wl,--threads=8 -C link-arg=-Wl,--as-needed -C link-arg=-Wl,-O2 -C link-arg=-Wl,--icf=safe -C link-arg=-Wl,--lto-O3
"

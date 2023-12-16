export TERMINAL=footclient
export XKB_DEFAULT_LAYOUT="latam,latam,us"
export XKB_DEFAULT_VARIANT=",dvorak,"
export XKB_DEFAULT_OPTIONS="grp:win_space_toggle,ctrl:nocaps,grp_led:scroll,keypad:pointerkeys,terminate:ctrl_alt_bksp,compose:ins,compose:prsc"

# Don't clutter $HOME
export GOPATH="${XDG_DATA_HOME:-${HOME}/.local/share}"/go
export CARGO_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"/cargo
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}"/pass
export ZDOTDIR="${XDG_CONFIG_DIR:-${HOME}/.config}/zsh"

export EMAIL="leohdz172@proton.me"

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c"

export GOPROXY=direct
export GOSUMDB=off

export CLANGD_FLAGS="-j=9 --clang-tidy --completion-parse=always --include-ineligible-results --malloc-trim --pch-storage=memory --header-insertion=never --background-index --completion-style=detailed"

export PATH="${XDG_CONFIG_HOME:-${HOME}/.config}/emacs/bin/:$PATH"
export EZA_ICONS_AUTO=true

if [ -n "${EPREFIX}" ]; then
  export TMPDIR="${EPREFIX}/tmp"
else
  export CHOST=x86_64-pc-linux-gnu
  export CC="${CHOST}-gcc"
  export CXX="${CHOST}-g++"
  export CFLAGS="-march=native -Og -pipe -flto=auto -Werror=odr -Werror=strict-aliasing -Werror=lto-type-mismatch -g3 -ggdb3"
  export CXXFLAGS="${CFLAGS}"
  export LDFLAGS="-Wl,--as-needed -Wl,-O2 -fuse-ld=mold -Wl,--threads=$(nproc)"
  export RUSTFLAGS="-C target-cpu=native -C opt-level=3 -C codegen-units=1 -C embed-bitcode=yes -C lto=thin -C linker-plugin-lto -C linker-flavor=gcc -C linker=rust-linker-wrapper"
fi

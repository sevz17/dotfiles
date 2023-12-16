function get_resume_offset() {
  echo $(($(sudo btrfs_map_physical /swapfile | awk '{ if ( NR == 2) { print $9; exit 0 } }')/$(getconf PAGESIZE)))
}

function ch() {
  local newroot="${1}"

  [ "${newroot}" = "-" -o "${newroot}" = "--" ] && unset newroot
  [ "${#}" -gt 1 ] && shift

  local cmd="${@}"
  sudo chroot "${newroot:=/mnt/arch}" "${cmd:=/bin/zsh}"
}

git_current_branch() {
  git branch --show-current
}

function get_potential_stable() {
  if [ -z "${EMAIL}" ]; then
    echo "\$EMAIL must be set" 1>&2
    return 1
  fi
  if command -v jq &> /dev/null; then
    curl -s "https://packages.gentoo.org/maintainer/${EMAIL}/stabilization.json" | jq
  else
    curl -s "https://packages.gentoo.org/maintainer/${EMAIL}/stabilization.list"
  fi
}

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

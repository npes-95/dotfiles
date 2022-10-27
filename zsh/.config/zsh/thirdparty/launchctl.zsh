lnctl_reload() {
  launchctl unload "$1"
  launchctl load "$1"
}

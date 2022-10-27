sync() {
  rsync -avh --delete "$1" "$2"
}

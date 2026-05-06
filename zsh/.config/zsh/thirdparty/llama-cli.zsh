chat () {
  llama-cli -m "$1" -ngl 99 -c 8192 --jinja
}

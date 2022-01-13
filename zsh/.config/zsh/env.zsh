# ~/.config/zsh/env.zsh

[[ -z "$OS" ]] && export OS=`uname`
case "$OS" in
  Linux)          export PLATFORM=linux ;;
  *indows*)       export PLATFORM=windows ;;
  FreeBSD|Darwin) export PLATFORM=mac ;;
  *)              export PLATFORM=unknown ;;
esac

if [[ $PLATFORM == 'mac' ]]; then
  PATH="/opt/homebrew/bin:$PATH"
  PATH="/opt/homebrew/sbin:$PATH"
fi

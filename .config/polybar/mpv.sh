#!/bin/sh

main() {
  if ! pgrep -x mpv >/dev/null; then
    echo ""; exit
  fi
  if pgrep -x ytsearch >/dev/null; then
	  echo ""; exit
  fi

  title=$(cat ~/.config/polybar/mpv-title)

  echo "$title"
}

main "$@"

#!/bin/sh

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  artist=$(playerctl --player=spotify metadata xesam:artist)
  album=$(playerctl --player=spotify metadata xesam:album)
  title=$(playerctl --player=spotify metadata xesam:title)

  if ["$artist" == ""]
  then
	 artist="Spotify AD"
  fi

  echo "$artist - $title"
}

main "$@"

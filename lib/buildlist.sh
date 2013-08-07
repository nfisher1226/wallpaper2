#!/bin/sh
WP_DIR="$(cat $HOME/.config/wallpaper/wp-dir)"
[ -d "$WP_DIR" ] && ls -1 "$(cat $HOME/.config/wallpaper/wp-dir)" \
  | egrep '.png|.jpg|.jpeg|.svg|.JPG|.PNG' | while read IMG
  do echo "$IMG"
done

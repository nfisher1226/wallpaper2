#!/bin/sh
ls -1 "$(cat $HOME/.config/wallpaper/wp-dir)" \
  | egrep '.png|.jpg|.jpeg|.svg|.JPG|.PNG' | \
while read IMG
do
 echo "$IMG"
done

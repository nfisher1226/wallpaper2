#!/bin/sh
ls "$(cat $HOME/.config/wallpaper/wp-dir)" \
  | egrep '.png|.jpg|.jpeg|.svg|.JPG|.PNG' | \
while read IMG
do
 echo "$IMG"
done

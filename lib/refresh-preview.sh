#!/bin/sh
IMG="$(cat $HOME/.config/wallpaper/current)"
if [ -f "$IMG" ] && \
   [ ! "$(echo $IMG | egrep '.png|.jpg|.jpeg|.PNG|.JPG|.svg')" = "" ]
   then ln -sf "$IMG" $HOME/.config/wallpaper/current.png
fi

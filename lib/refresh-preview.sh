#!/bin/sh
if [ -f "$WP_DIR/$WP" ] && \
   [ ! "$(echo $WP | egrep '.png|.jpg|.jpeg|.PNG|.JPG|.svg')" = "" ]
   then ln -sf "$WP_DIR/$WP" $HOME/.config/wallpaper/current.png
fi

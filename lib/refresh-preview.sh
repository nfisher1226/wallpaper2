#!/bin/sh
[ ! -d "$HOME/.config/wallpaper/thumbs" ] && \
  install -dv $HOME/.config/wallpaper/thumbs
IMG="$(cat $HOME/.config/wallpaper/current)"

. $LIBDIR/preview-backends/${PREVIEW_BACKEND}.sh

gen_preview

ln -sf "$HOME/.config/wallpaper/thumbs/$(basename $IMG).png" \
  $HOME/.config/wallpaper/current.png

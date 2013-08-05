gen_preview () {
if [ ! -f "$HOME/.config/wallpaper/thumbs/$(basename $IMG).png" ] ; then
  convert -resize 300x "$IMG" "$HOME/.config/wallpaper/thumbs/$(basename $IMG).png"
fi
}

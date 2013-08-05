gen_preview () {
if [ ! -f "$HOME/.config/wallpaper/thumbs/$(basename $IMG).png" ] ; then
  if [ ! "$(echo $IMG | egrep '.png|.PNG')" = "" ] && \
     [ ! "$(file "$IMG" | grep 'PNG image data')" = "" ]
    then pngtopnm "$IMG" | pamscale -width=300 | pnmtopng > \
      "$HOME/.config/wallpaper/thumbs/$(basename $IMG).png"
  elif [ ! "$(echo $IMG | egrep '.jpg|.JPG|.jpeg|.JPEG')" = "" ] && \
       [ ! "$(file "$IMG" | grep 'JPEG image data')" = "" ]
    then jpegtopnm "$IMG" | pamscale -width=300 | pnmtopng > \
      "$HOME/.config/wallpaper/thumbs/$(basename $IMG).png"
  elif [ ! "$(echo $IMG | egrep '.svg|.SVG')" = "" ]  && \
       [ ! "$(file "$IMG" | grep 'SVG Scalable Vector Graphics')" = "" ]
    then rsvg-convert -w 300 "$IMG" > \
      "$HOME/.config/wallpaper/thumbs/$(basename $IMG).png"
  fi
fi
}

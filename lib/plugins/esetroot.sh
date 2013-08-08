if [ ! "$(which esetroot 2>/dev/null)" = "" ] ; then
  ESETROOT=esetroot
elif [ ! "$(which Esetroot 2>/dev/null)" = "" ] ; then
  ESETROOT=Esetroot
fi

set_wallpaper () {

MODE="$1"
[ "$MODE" = "" ] && MODE="-scale"
[ "$MODE" = "Center" ] && MODE="-center"
[ "$MODE" = "Scale" ] && MODE="-fit"
[ "$MODE" = "Stretch" ] && MODE="-scale"
[ "$MODE" = "Tile" ] && MODE="-center"

$ESETROOT $MODE "$2"
}

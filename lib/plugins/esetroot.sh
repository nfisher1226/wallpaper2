if [ ! "$(which esetroot)" = "" ] ; then
  ESETROOT=esetroot
elif [ ! "$(which Esetroot)" = "" ] ; then
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

set_wallpaper () {

MODE="$1"
[ "$MODE" = "" ] && MODE="-s f"
[ "$MODE" = "Center" ] && MODE="-p c"
[ "$MODE" = "Scale" ] && MODE="-s a"
[ "$MODE" = "Stretch" ] && MODE="-s f"
[ "$MODE" = "Tile" ] && MODE="-t"

imlibsetroot $MODE "$2"
}

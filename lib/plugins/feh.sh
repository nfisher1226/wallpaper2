set_wallpaper () {

MODE="$1"
[ "$MODE" = "" ] && MODE="--bg-scale"
[ "$MODE" = "Center" ] && MODE="--bg-center"
[ "$MODE" = "Scale" ] && MODE="--bg-fill"
[ "$MODE" = "Stretch" ] && MODE="--bg-scale"
[ "$MODE" = "Tile" ] && MODE="--bg-tile"

feh $MODE "$2"
}

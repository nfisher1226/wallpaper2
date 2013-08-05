set_wallpaper () {

MODE="$(cat $HOME/.config/wallpaper/mode)"
[ "$MODE" = "" ] && MODE="--bg-scale"
[ "$MODE" = "Center" ] && MODE="--bg-center"
[ "$MODE" = "Scale" ] && MODE="--bg-fill"
[ "$MODE" = "Stretch" ] && MODE="--bg-scale"
[ "$MODE" = "Tile" ] && MODE="--bg-tile"

feh $MODE "$1"
}

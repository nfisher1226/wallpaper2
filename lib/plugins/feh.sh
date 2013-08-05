set_wallpaper () {

MODE="`cat $HOME/.config/wallpaper/backgroundmode`"
[ "$MODE" = "" ] && MODE="--bg-scale"
[ "$MODE" = "Centred" ] && MODE="--bg-centre"
[ "$MODE" = "Scaled" ] && MODE="--bg-scale"
[ "$MODE" = "Stretch" ] && MODE="--bg-scale"

feh $MODE "$1"
}

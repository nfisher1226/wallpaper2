set_backdrop () {

MODE="`cat $HOME/.config/wallpaper/backgroundmode`"
[ "$MODE" = "" ] && MODE="--bg-scale"
[ "$MODE" = "Centred" ] && MODE="--bg-centre"
[ "$MODE" = "Scaled" ] && MODE="--bg-scale"

feh $MODE "$1"
}
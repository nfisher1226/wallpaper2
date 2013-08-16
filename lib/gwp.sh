set_wallpaper () {
[ "$STRETCH" = "true" ] && MODE=Stretch
[ "$SCALE" = "true" ] && MODE=Scale
[ "$CENTER" = "true" ] && MODE=Center
[ "$TILE" = "true" ] && MODE=Tile
[ "$FEH" = "true" ] && BACKEND=feh
[ "$ROX" = "true" ] && BACKEND=rox
[ "$IMLIBSETROOT" = "true" ] && BACKEND=imlibsetroot
[ "ESETROOT" = "true" ] && BACKEND=esetroot
[[ -z "$BACKEND" ]] && BACKEND=feh
. $LIBDIR/plugins/${BACKEND}.sh
set_wallpaper "$MODE" "$WP"
}
export -f set_wallpaper

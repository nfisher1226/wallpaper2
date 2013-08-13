set_wallpaper () {
[ -f "$USERCONFIGDIR/conf" ] && . "$USERCONFIGDIR/conf"
[[ -z "$BACKEND" ]] && BACKEND=feh
. $LIBDIR/plugins/${BACKEND}.sh
set_wallpaper "$MODE" "$WP_DIR/$WP"
}
export -f set_wallpaper

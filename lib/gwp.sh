set_wallpaper () {
case true in
  $STRETCH) MODE=Stretch ;;
  $SCALE) MODE=Scale ;;
  $CENTER) MODE=Center ;;
  $TILE) MODE=Tile ;;
esac
case true in
  $FEH) BACKEND=feh ;;
  $ROX) BACKEND=rox ;;
  $IMLIBSETROOT) BACKEND=imlibsetroot ;;
  $ESETROOT) BACKEND=esetroot ;;
esac
: ${MODE:=Stretch}
: ${BACKEND:=$DEFAULT_BACKEND}
. $LIBDIR/plugins/${BACKEND}.sh
set_wallpaper "$MODE" "$WP"
}
export -f set_wallpaper

#!/bin/sh
[ "$BACKEND" = "" ] && BACKEND=feh
. $LIBDIR/plugins/${BACKEND}.sh
set_wallpaper "$MODE" "$WP_DIR/$WP"

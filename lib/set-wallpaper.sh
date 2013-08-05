#!/bin/sh
WP_BACKEND="$(cat $USERCONFIGDIR/backend)"
[ "$WP_BACKEND" = "" ] && WP_BACKEND=feh
. $LIBDIR/plugins/${WP_BACKEND}.sh
set_wallpaper "$1"

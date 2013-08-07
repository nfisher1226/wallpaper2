#!/bin/sh
[ -d "$WP_DIR" ] && ls -1 "$WP_DIR" \
  | egrep '.png|.jpg|.jpeg|.svg|.JPG|.PNG' | while read IMG
  do echo "$IMG"
done

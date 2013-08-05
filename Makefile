PREFIX ?=/usr/local
SYSCONFDIR ?= ${PREFIX}/etc
BINDIR = ${PREFIX}/bin
LIBDIR = ${PREFIX}/lib/wallpaper
BIN_OBJS = bin/wallpaper
CONF_OBJS = etc/conf
LIB_OBJS = lib/buildlist.sh lib/refresh-preview.sh
PLUGIN_OBJS = \
lib/plugins/rox.sh \
lib/plugins/feh.sh
PREVIEW_OBJS = \
lib/preview-backends/imagemagick.sh \
lib/preview-backends/netpbm.sh

all: bin/wallpaper
	@echo "Now run \"make install\""

bin/wallpaper:
	sed "s%@@@SYSCONFDIR@@@%${SYSCONFDIR}%" bin/wallpaper.in \
		> bin/wallpaper

install-bin: all
	install -d ${DESTDIR}${BINDIR}
	for OBJ in ${BIN_OBJS} ; \
		do install -m 755 $${OBJ} ${DESTDIR}${BINDIR} ; done

install-conf:
	install -d ${DESTDIR}${SYSCONFDIR}/wallpaper
	for OBJ in ${CONF_OBJS} ; \
		do install -m 644 $${OBJ} ${DESTDIR}${SYSCONFDIR}/wallpaper ; done

install-libs:
	install -d ${DESTDIR}${LIBDIR}
	for OBJ in ${LIB_OBJS} ; \
		do install -m 755 $${OBJ} ${DESTDIR}${LIBDIR} ; done
	install -d ${DESTDIR}${LIBDIR}/plugins
	for OBJ in ${PLUGIN_OBJS} ; \
		do install -m 644 $${OBJ} ${DESTDIR}${LIBDIR}/plugins ; done
	install -d ${DESTDIR}${LIBDIR}/preview-backends
	for OBJ in ${PREVIEW_OBJS} ; \
		do install -m 644 $${OBJ} \
			${DESTDIR}${LIBDIR}/preview-backends ; done


install: install-bin install-conf install-libs

clean:
	rm -f bin/wallpaper

.PHONY: all install-bin install-conf install-libs install clean

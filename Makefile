PREFIX ?=/usr/local
SYSCONFDIR ?= ${PREFIX}/etc
BINDIR = ${PREFIX}/bin
LIBDIR = ${PREFIX}/lib/wallpaper
BIN_OBJS = bin/wallpaper
CONF_OBJS = etc/conf

LIB_OBJS = \
lib/buildlist.sh \
lib/refresh-preview.sh \
lib/set-wallpaper.sh

PLUGIN_OBJS = \
lib/plugins/rox.sh \
lib/plugins/feh.sh \
lib/plugins/esetroot.sh \
lib/plugins/imlibsetroot.sh

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

install-desktop:
	install -d ${DESTDIR}${PREFIX}/share/applications
	install -m 644 share/wallpaper.desktop ${DESTDIR}${PREFIX}/share/applications

install-libs:
	install -d ${DESTDIR}${LIBDIR}
	for OBJ in ${LIB_OBJS} ; \
		do install -m 755 $${OBJ} ${DESTDIR}${LIBDIR} ; done
	install -d ${DESTDIR}${LIBDIR}/plugins
	for OBJ in ${PLUGIN_OBJS} ; \
		do install -m 644 $${OBJ} ${DESTDIR}${LIBDIR}/plugins ; done


install: install-bin install-conf install-desktop install-libs

clean:
	rm -f bin/wallpaper

.PHONY: all install-bin install-conf install-libs install clean

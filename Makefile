PROGNAME = gwp
CLIPROG = cwp
PREFIX ?=/usr/local
SYSCONFDIR ?= ${PREFIX}/etc
BINDIR = ${PREFIX}/bin
LIBDIR = ${PREFIX}/lib/${PROGNAME}
DOCDIR ?= ${PREFIX}/share/doc/${PROGNAME}
BIN_OBJS = \
bin/${PROGNAME} \
bin/${CLIPROG}
CONF_OBJS = etc/conf
DOC_OBJS = README INSTALL COPYING

LIB_OBJS = \
lib/buildlist.sh \
lib/refresh-preview.sh \
lib/set-wallpaper.sh

PLUGIN_OBJS = \
lib/plugins/rox.sh \
lib/plugins/feh.sh \
lib/plugins/esetroot.sh \
lib/plugins/imlibsetroot.sh

all: bin/${PROGNAME} bin/${CLIPROG}
	@echo "Now run \"make install\""

bin/${PROGNAME}:
	sed "s%@@@SYSCONFDIR@@@%${SYSCONFDIR}%" bin/${PROGNAME}.in \
		> bin/${PROGNAME}

bin/${CLIPROG}:
	sed "s%@@@LIBDIR@@@%${LIBDIR}%" bin/${CLIPROG}.in \
		> bin/${CLIPROG}

install-bin: all
	install -d ${DESTDIR}${BINDIR}
	for OBJ in ${BIN_OBJS} ; \
		do install -m 755 $${OBJ} ${DESTDIR}${BINDIR} ; done

install-conf:
	install -d ${DESTDIR}${SYSCONFDIR}/${PROGNAME}
	for OBJ in ${CONF_OBJS} ; \
		do install -m 644 $${OBJ} ${DESTDIR}${SYSCONFDIR}/${PROGNAME} ; done

install-desktop:
	install -d ${DESTDIR}${PREFIX}/share/applications
	install -m 644 share/${PROGNAME}.desktop ${DESTDIR}${PREFIX}/share/applications

install-doc:
	install -d ${DESTDIR}${DOCDIR}
	for OBJ in ${DOC_OBJS} ; \
		do install -m 644 $${OBJ} ${DESTDIR}${DOCDIR}


install-libs:
	install -d ${DESTDIR}${LIBDIR}
	for OBJ in ${LIB_OBJS} ; \
		do install -m 755 $${OBJ} ${DESTDIR}${LIBDIR} ; done
	install -d ${DESTDIR}${LIBDIR}/plugins
	for OBJ in ${PLUGIN_OBJS} ; \
		do install -m 644 $${OBJ} ${DESTDIR}${LIBDIR}/plugins ; done


install: install-bin install-conf install-desktop install-libs

clean:
	rm -f bin/${PROGNAME} bin/${CLIPROG}

.PHONY: all install-bin install-conf install-libs install clean

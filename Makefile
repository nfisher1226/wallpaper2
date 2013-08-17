PROGNAME = gwp
VERSION = 2.0a2
CLIPROG = cwp
PREFIX ?=/usr/local
SYSCONFDIR ?= ${PREFIX}/etc
BINDIR = ${PREFIX}/bin
LIBDIR = ${PREFIX}/lib/${PROGNAME}
DOCDIR ?= ${PREFIX}/share/doc/${PROGNAME}
BIN_OBJS = \
bin/${PROGNAME} \
bin/${CLIPROG}
CONF_OBJS = conf
THEME_OBJS = gtkrc stock-transparency-24.png vspace.png
DOC_OBJS = README INSTALL COPYING

LIB_OBJS = \
gwp.sh

PLUGIN_OBJS = \
rox.sh \
feh.sh \
esetroot.sh \
imlibsetroot.sh

GUI_OBJS = \
about.sh \
preferences.sh \
slideshow-editor.sh

all: bin/${PROGNAME} bin/${CLIPROG}
	@echo "Now run \"make install\""

bin/${PROGNAME}:
	sed "s%@@@SYSCONFDIR@@@%${SYSCONFDIR}%" bin/${PROGNAME}.in \
		> bin/${PROGNAME}

bin/${CLIPROG}:
	sed -e "s%@@@LIBDIR@@@%${LIBDIR}%" \
		-e "s%@@@SYSCONFDIR@@@%${SYSCONFDIR}%" \
		bin/${CLIPROG}.in > bin/${CLIPROG}

install-bin: all
	install -d ${DESTDIR}${BINDIR}
	for OBJ in ${BIN_OBJS} ; \
		do install -m 755 $${OBJ} ${DESTDIR}${BINDIR} ; done

install-conf: etc/theme/gtkrc
	install -d ${DESTDIR}${SYSCONFDIR}/${PROGNAME}/theme
	for OBJ in ${CONF_OBJS} ; \
		do install -m 644 etc/$${OBJ} \
			${DESTDIR}${SYSCONFDIR}/${PROGNAME} ; done
	for OBJ in ${THEME_OBJS} ; \
		do install -m 644 etc/theme/$${OBJ} \
			${DESTDIR}${SYSCONFDIR}/${PROGNAME}/theme ; done

etc/theme/gtkrc:
	sed "s%@@@CONFDIR@@@%${SYSCONFDIR}/%" etc/theme/gtkrc.in \
		> etc/theme/gtkrc

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
		do install -m 644 lib/$${OBJ} ${DESTDIR}${LIBDIR} ; done
	install -d ${DESTDIR}${LIBDIR}/gui
	for OBJ in ${GUI_OBJS} ; \
		do install -m 644 lib/gui/$${OBJ} \
			${DESTDIR}${LIBDIR}/gui ; done
	install -d ${DESTDIR}${LIBDIR}/plugins
	for OBJ in ${PLUGIN_OBJS} ; \
		do install -m 644 lib/plugins/$${OBJ} \
			${DESTDIR}${LIBDIR}/plugins ; done


install: install-bin install-conf install-desktop install-libs

clean:
	rm -f bin/${PROGNAME} bin/${CLIPROG} etc/theme/gtkrc

petpkg: puppy/${PROGNAME}-${VERSION}.pet

puppy/${PROGNAME}-${VERSION}.pet:
	$(MAKE) PREFIX=/usr SYSCONFDIR=/etc \
		DESTDIR=puppy/${PROGNAME}-${VERSION} install
	sed -e "s/PROGNAME/${PROGNAME}/g" -e "s/VERSION/${VERSION}/g" \
		-e "s/SIZE/$$(du -hc puppy/${PROGNAME}-${VERSION} | tail -n 1 | \
		cut -f 1)/" puppy/pet.specs.in > \
		puppy/${PROGNAME}-${VERSION}/pet.specs
	cd puppy ; tar czf ${PROGNAME}-${VERSION}.pet ${PROGNAME}-${VERSION}
	echo $$(md5sum puppy/${PROGNAME}-${VERSION}.pet | cut -f 1 -d ' ') \
		>> puppy/${PROGNAME}-${VERSION}.pet
	@echo
	@echo 'Pet package created as puppy/${PROGNAME}-${VERSION}.pet'

petclean: clean
	rm -rf puppy/${PROGNAME}-${VERSION}.pet
	rm -rf puppy/${PROGNAME}-${VERSION}

.PHONY: \
all \
install-bin \
install-conf \
install-libs \
install \
clean \
petpkg \
petclean

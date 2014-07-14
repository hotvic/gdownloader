bin_PROGRAMS = gdownloader

AM_CFLAGS =                                  \
			$(GTK_CFLAGS)                    \
			$(LIBPEAS_CFLAGS)                \
			-DLOCALEDIR=\""$(localedir)"\"   \
			-DPKGDATADIR=\""$(pkgdatadir)"\" \
			-DPKGLIBDIR=\""$(pkglibdir)"\"
LDADD = $(GTK_LIBS) $(LIBPEAS_LIBS)
gdownloader_VALAFLAGS =                                 \
						--vapidir=../vapi               \
						--pkg config                    \
			            --pkg gtk+-3.0                  \
						--pkg gobject-introspection-1.0 \
						--pkg libpeas-1.0               \
						--pkg libpeas-gtk-1.0           \
                        --target-glib=2.38              \
						--gresources gdownloader.gresources.xml
gdownloader_SOURCES =                               \
					  gd-application.vala           \
					  gd-window.vala                \
					  gd-preferences.vala           \
					  gd-plugin-engine.vala         \
					  gd-hoster-plugin-engine.vala  \
					  gd-utils.vala                 \
					  gd-dirs.vala                  \
					  gdownloader.gresources.c      \
					  main.vala

gdownloader.gresources.c: $(top_srcdir)/src/gdownloader.gresources.xml $(shell $(GLIB_COMPILE_RESOURCES) --generate-dependencies --sourcedir="$(top_srcdir)/src" $(top_srcdir)/src/gdownloader.gresources.xml)
	$(AM_V_GEN) $(GLIB_COMPILE_RESOURCES) --generate-source --sourcedir="$(top_srcdir)/src" --target $@ $<


BUILT_SOURCES = gdownloader.gresources.c
CLEANFILES = gdownloader.gresources.c

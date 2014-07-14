#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([GDownloader], [0.1a], [https://github.com/hotvic/GDownloader/issues])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([src/main.vala])


AM_INIT_AUTOMAKE([-Wall -Wno-portability foreign])

AM_SILENT_RULES([yes])


# Checks for programs.
AC_PROG_CC
AM_PROG_VALAC

# Checks for libraries.
PKG_CHECK_MODULES([GTK], [glib-2.0 >= 2.38, gtk+-3.0 >= 3.10, gobject-introspection-1.0])
PKG_CHECK_MODULES([LIBPEAS], [libpeas-1.0, libpeas-gtk-1.0])

# Resources
AC_PATH_PROG(GLIB_COMPILE_RESOURCES, glib-compile-resources)


AC_CONFIG_FILES([Makefile
                 src/Makefile])
AC_OUTPUT

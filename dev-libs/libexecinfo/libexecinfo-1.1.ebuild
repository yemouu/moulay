# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quick-n-dirty BSD licensed clone of the GNU libc backtrace facility"
HOMEPAGE="https://www.freshports.org/devel/libexecinfo"
SRC_URI="http://distcache.freebsd.org/local-distfiles/itetcu/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}/01-execinfo.patch"
	"${FILESDIR}/02-makefile.patch"
	"${FILESDIR}/03-define-gnu-source.patch"
)

src_install() {
	einstalldocs
	doheader execinfo.h
	doheader stacktraverse.h
	dolib.a libexecinfo.a
	dolib.so libexecinfo.so.1
	dosym libexecinfo.so.1 "${EPREFIX}"/usr/lib/libexecinfo.so
}

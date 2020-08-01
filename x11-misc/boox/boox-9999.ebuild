# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 savedconfig

DESCRIPTION="Tool to select a region on the screen and print it to stdout"
HOMEPAGE="https://github.com/BanchouBoo/boox"
EGIT_REPO_URI="https://github.com/BanchouBoo/boox"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util-cursor
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	restore_config src/config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
	save_config src/config.h
}

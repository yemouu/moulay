# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="mawww's experiment for a better code editor."
HOMEPAGE="http://kakoune.org/"
SRC_URI="https://github.com/mawww/${PN}/archive/v${PV}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/ncurses[unicode]"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

PATCHES=( ${FILESDIR}/${PN}-Makefile.patch )

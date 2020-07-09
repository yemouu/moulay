# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple X background setter inspired by imlibsetroot and feh"
HOMEPAGE="https://github.com/ttzhou/setroot"
SRC_URI="https://github.com/ttzhou/setroot/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xinerama"

DEPEND="
	media-libs/imlib2
	xinerama? ( x11-libs/libXinerama )
"
RDEPEND="${DEPEND}"

src_compile() {
	emake xinerama=$(usex xinerama 1 0)
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}

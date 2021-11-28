# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple X background setter inspired by imlibsetroot and feh"
HOMEPAGE="https://github.com/ttzhou/setroot"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ttzhou/${PN}"
else
	SRC_URI="https://github.com/ttzhou/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="xinerama"

RDEPEND="
	media-libs/imlib2
	xinerama? ( x11-libs/libXinerama )
"
DEPEND="${RDEPEND}"

src_compile() {
	emake xinerama=$(usex xinerama 1 0)
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}

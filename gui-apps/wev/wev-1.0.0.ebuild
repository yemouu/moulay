# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tool for debugging events on a Wayland window, analagous to the X11 tool xev"
HOMEPAGE="https://git.sr.ht/~sircmpwn/wev"
SRC_URI="https://git.sr.ht/~sircmpwn/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-libs/wayland
	x11-libs/libxkbcommon"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
	dodoc README.md
}

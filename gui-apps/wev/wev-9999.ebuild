# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Tool for debugging events on a Wayland window, analagous to the X11 tool xev."
HOMEPAGE="https://git.sr.ht/~sircmpwn/wev"
EGIT_REPO_URI="https://git.sr.ht/~sircmpwn/wev"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/wayland
	x11-libs/libxkbcommon"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
	dodoc README.md
}

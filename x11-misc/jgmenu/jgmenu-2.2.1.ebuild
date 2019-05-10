# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg

DESCRIPTION="A small and simple X11 menu"
HOMEPAGE="https://github.com/johanmalm/jgmenu"
SRC_URI="https://github.com/johanmalm/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/cairo
	x11-libs/pango
	gnome-base/librsvg
	dev-libs/libxml2
	dev-libs/glib
	lxde-base/menu-cache"
	RDEPEND="${DEPEND}"
	BDEPEND=""

src_prepare() {
	if declare -p PATCHES | grep -q "^declare -a "; then
		[[ -n ${PATCHES[@]} ]] && eapply "${PATCHES[@]}"
	else
		[[ -n ${PATCHES} ]] && eapply ${PATCHES}
	fi
	eapply_user

	sed -i -e '1{x;s/^/first/;x;}' -e '1,/foo/{x;/first/s///;x;s/\/usr\/local/\/usr/;}' Makefile
}

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson xdg-utils

DESCRIPTION="A fast, lightweight and minimalistic Wayland terminal emulator"
HOMEPAGE="https://codeberg.org/dnkl/foot"
if [[ ${PV} == 9999 ]]
then
	EGIT_REPO_URI="https://codeberg.org/dnkl/foot"
	inherit git-r3
else
	SRC_URI="https://codeberg.org/dnkl/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+ime"

RDEPEND="
	dev-libs/fcft
	dev-libs/wayland
	dev-util/wayland-scanner
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/libxkbcommon
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/scdoc
	dev-libs/tllist
	sys-libs/ncurses
"

DOC=( "README.md" "CHANGELOG.md" "foot.ini" )
PATCHES=( "${FILESDIR}/gentoo-fhs.patch" )

src_configure() {
	local emesonargs=(
		-Dime=$(usex ime true false)
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}

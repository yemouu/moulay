# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A Wayland kiosk"
HOMEPAGE="https://www.hjdskes.nl/projects/cage"
SRC_URI="https://github.com/Hjdskes/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X +man"

RDEPEND="
	<gui-libs/wlroots-0.15.0[X?]
	>=gui-libs/wlroots-0.14.0[X?]
	dev-libs/wayland
	dev-libs/wayland-protocols
	x11-libs/libxkbcommon
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/wayland-scanner
	man? ( app-text/scdoc )
"

src_configure() {
	local emesonargs=(
		$(meson_feature man man-pages)
		$(meson_use X xwayland)
	)

	meson_src_configure
}

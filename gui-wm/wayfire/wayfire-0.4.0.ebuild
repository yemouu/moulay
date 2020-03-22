# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="3D wayland compositor."
HOMEPAGE="https://wayfire.org/"
SRC_URI="https://github.com/WayfireWM/${PN}/archive/${PV}.tar.gz"
IUSE="X"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-libs/libevdev
	dev-libs/libinput
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/wf-config
	gui-libs/wlroots[X=]
	media-libs/freetype
	media-libs/glm
	virtual/jpeg
	media-libs/libpng
	media-libs/mesa
	x11-libs/cairo
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pixman"
DEPEND="${RDEPEND}"
BDEPEND=""

DOCS=( wayfire.ini README.md )

src_install() {
	meson_src_install
	insinto /usr/share/wayland-sessions/
	insotps -m644
	doins wayfire.desktop
}

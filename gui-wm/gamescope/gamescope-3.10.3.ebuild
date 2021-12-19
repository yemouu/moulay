# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="The micro-compositor formerly known as steamcompmgr"
HOMEPAGE="https://github.com/Plagman/gamescope"

LIBLIFTOFF_COMMIT="2e1dd93b60224e77f6a49ad8fb36d184e3a9a3bc"
WLROOTS_COMMIT="3e801d68f2c6c64567b1f24c6d03893f32c81197"
SRC_URI="
	https://github.com/Plagman/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://gitlab.freedesktop.org/emersion/libliftoff/-/archive/${LIBLIFTOFF_COMMIT}.tar.gz -> libliftoff-${LIBLIFTOFF_COMMIT}.tar.gz
	https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/${WLROOTS_COMMIT}.tar.gz -> wlroots-${WLROOTS_COMMIT}.tar.gz
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+screencast"

# Uses libliftoff >=0.2.0 < 0.3.0, this version of libliftoff isn't released
# yet so we will just use the bundled subproject
# Uses wlroots >= 0.15.0 < 0.16.0, this version of wlroots isn't released yet
# so we will just use the bundled subproject
# I'm also including the dependencies for both libliftoff and wlroots here
# until these versions get officially released. gamescope dependencies are
# listed first followed by wlroots and libliftoff (libdrm)
RDEPEND="
	dev-libs/stb
	dev-libs/wayland
	dev-libs/wayland-protocols
	dev-util/glslang
	dev-util/vulkan-headers
	media-libs/libsdl2
	media-libs/vulkan-loader
	screencast? ( media-video/pipewire )
	sys-libs/libcap
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXres
	x11-libs/libXtst
	x11-libs/libXxf86vm
	x11-libs/libdrm
	x11-libs/libxkbcommon

	>=dev-libs/libinput-1.14.0:0=
	media-libs/mesa[egl(+),gles2,gbm(+)]
	sys-auth/seatd:=
	virtual/libudev
	x11-libs/pixman
	x11-base/xwayland
	x11-libs/libxcb:0=
	x11-libs/xcb-util-image
	x11-libs/xcb-util-wm
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/wayland-scanner
"

PATCHES=( "${FILESDIR}/${P}-system-stb.patch" )

src_prepare() {
	rm -r subprojects/libliftoff || die
	mv "../libliftoff-${LIBLIFTOFF_COMMIT}" subprojects/libliftoff || die
	rm -r subprojects/wlroots || die
	mv "../wlroots-${WLROOTS_COMMIT}" subprojects/wlroots || die

	default
}

src_configure() {
	local emesonargs=(
		$(meson_feature screencast pipewire)
	)

	meson_src_configure
}

src_install() {
	meson_src_install --skip-subprojects
}

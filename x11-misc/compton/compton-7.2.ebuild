# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop meson git-r3 xdg

DESCRIPTION="A compositor for X11, active fork."
HOMEPAGE="https://github.com/yshui/compton"
EGIT_REPO_URI="${HOMEPAGE} -> ${P}.tar.gz"
EGIT_BRANCH="stable/7"
EGIT_COMMIT="1081078691e10ff57326f026abcb2edc1b330bdb"

LICENSE="MPL-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+config dbus +doc +opengl +pcre"

DEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libxcb
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-image
	x11-libs/pixman
	dev-libs/libev
	dev-libs/uthash
	dbus? ( sys-apps/dbus )
	config? ( dev-libs/libconfig
		dev-libs/libxdg-basedir )
	opengl? ( media-libs/mesa )
	pcre? ( dev-libs/libpcre )"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/asciidoc )"

src_configure() {
	local emesonargs=(
		-Ddbus=$(usex dbus true false)
		-Dconfig_file=$(usex config true false)
		-Dopengl=$(usex opengl true false)
		-Dregex=$(usex pcre true false)
		-Dbuild_docs=$(usex doc true false)
	)
	meson_src_configure
}

src_install() {
	dodoc CONTRIBUTORS
	docinto examples
	dodoc compton-*-fshader-win.glsl compton.sample.conf
	use dbus && dodoc -r dbus-examples
	meson_src_install
}

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Utility for screen recording of wlroots-based compositors."
HOMEPAGE="https://github.com/ammen99/wf-recorder"
SRC_URI="https://github.com/ammen99/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+opencl"

RDEPEND="media-video/ffmpeg
	dev-libs/wayland
	dev-libs/wayland-protocols"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		-Dopencl=$(usex opencl enabled disabled)
	)

	meson_src_configure
}

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="Utility for screen recording of wlroots-based compositors."
HOMEPAGE="https://github.com/ammen99/wf-recorder"
EGIT_REPO_URI="https://github.com/ammen99/wf-recorder"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
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

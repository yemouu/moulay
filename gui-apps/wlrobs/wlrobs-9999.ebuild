# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial

DESCRIPTION="OBS plugin allowing screen capture on wlroots based compositors."
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
EHG_REPO_URI="https://hg.sr.ht/~scoopta/wlrobs"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/wayland
	media-video/obs-studio"
DEPEND="${RDEPEND}"

src_compile() {
	cd Release
	emake || die "emake failed"
}

src_install() {
	OBS_PLUGIN_DIR="/usr/share/obs/obs-plugins"
	insinto ${OBS_PLUGIN_DIR}/wlrobs/bin/64bit
	doins Release/libwlrobs.so
}

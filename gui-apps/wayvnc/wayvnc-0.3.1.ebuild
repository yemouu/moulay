# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A VNC server for wlroots based Wayland compositors"
HOMEPAGE="https://github.com/any1/wayvnc"

if [[ ${PV} = 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/any1/${PN}"
else
	SRC_URI="https://github.com/any1/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="ISC"
SLOT="0"

RDEPEND="
	dev-libs/aml
	dev-libs/wayland
	elibc_musl? ( sys-libs/queue-standalone )
	media-libs/mesa
	net-misc/neatvnc
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="app-text/scdoc"

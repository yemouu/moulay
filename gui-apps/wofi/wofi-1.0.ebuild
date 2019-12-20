# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Wofi is a menu program for wlroots based wayland compositors."
HOMEPAGE="https://hg.sr.ht/~scoopta/wofi"
SRC_URI="https://hg.sr.ht/~scoopta/wofi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-libs/wayland
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${PN}-v${PV}"

src_compile() {
	cd Release
	emake || die "emake failed"
}

src_install() {
	dobin Release/wofi
}

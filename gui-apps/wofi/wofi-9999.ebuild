# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial

DESCRIPTION="Wofi is a menu program for wlroots based wayland compositors."
HOMEPAGE="https://hg.sr.ht/~scoopta/wofi"
EHG_REPO_URI="https://hg.sr.ht/~scoopta/wofi"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/wayland
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_compile() {
	cd Release
	emake || die "emake failed"
}

src_install() {
	dobin Release/wofi
}

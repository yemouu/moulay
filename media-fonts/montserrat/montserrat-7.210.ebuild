# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Fontface inspired by the traditional Montserrat neighborhood of Buenos Aires"
HOMEPAGE="https://fonts.google.com/specimen/Montserrat"
SRC_URI="https://github.com/JulietaUla/${PN}/archive/v${PV}.tar.gz"

IUSE="otf +ttf"
REQUIRED_USE="^^ ( ttf otf )"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/Montserrat-${PV}"

src_install() {
	if use ttf
	then
		FONT_SUFFIX="ttf"
		FONT_S="fonts/ttf"
	fi

	if use otf
	then
		FONT_SUFFIX="otf"
		FONT_S="fonts/otf"
	fi

	font_src_install
}

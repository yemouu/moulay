# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Fontface inspired by the traditional Montserrat neighborhood of Buenos Aires"
HOMEPAGE="https://fonts.google.com/specimen/Montserrat"
SRC_URI="https://github.com/JulietaUla/${PN}/archive/v${PV}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="otf +ttf"
REQUIRED_USE="^^ ( otf ttf )"

S="${WORKDIR}/Montserrat-${PV}"

src_install() {
	if use otf
	then
		FONT_SUFFIX="otf"
		FONT_S="fonts/otf"
	fi

	if use ttf
	then
		FONT_SUFFIX="ttf"
		FONT_S="fonts/ttf"
	fi

	font_src_install
}

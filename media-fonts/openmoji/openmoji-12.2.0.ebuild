# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FONT_SUFFIX="ttf"

inherit font unpacker

DESCRIPTION="Open source emojis for designers, developers and everyone else!"
HOMEPAGE="https://openmoji.org/"
SRC_URI="https://github.com/hfg-gmuend/${PN}/releases/download/${PV}/${PN}-font.zip"
IUSE=""

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

S="${WORKDIR}"

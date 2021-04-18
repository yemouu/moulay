# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A small font loading and glyph rasterization library"
HOMEPAGE="https://codeberg.org/dnkl/fcft"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://codeberg.org/dnkl/${PN}"
else
	SRC_URI="https://codeberg.org/dnkl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+text-shaping"

RDEPEND="
	dev-libs/tllist
	media-libs/fontconfig
	media-libs/freetype
	text-shaping? ( media-libs/harfbuzz )
	x11-libs/pixman
"
DEPEND="${RDEPEND}"

DOCS=( "README.md" "CHANGELOG.md" )
PATCHES=( "${FILESDIR}/gentoo-fhs.patch" )

src_configure() {
	local emesonargs=(
		-Dtext-shaping=$(usex text-shaping enabled disabled)
	)
	meson_src_configure
}

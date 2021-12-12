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
IUSE="+doc +grapheme-shaping +run-shaping"
REQUIRED_USE="run-shaping? ( grapheme-shaping )"

RDEPEND="
	grapheme-shaping? ( media-libs/harfbuzz )
	media-libs/fontconfig
	media-libs/freetype
	run-shaping? ( dev-libs/libutf8proc )
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="
	doc? ( app-text/scdoc )
	dev-libs/tllist
"

src_prepare() {
	default

	sed -i "s/'fcft'))/'${PF}'))/" meson.build || die
}

src_configure() {
	local emesonargs=(
		$(meson_feature doc docs)
		$(meson_feature grapheme-shaping)
		$(meson_feature run-shaping)
	)
	meson_src_configure
}

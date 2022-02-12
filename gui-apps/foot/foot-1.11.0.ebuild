# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic meson ninja-utils toolchain-funcs xdg

DESCRIPTION="A fast, lightweight and minimalistic Wayland terminal emulator"
HOMEPAGE="https://codeberg.org/dnkl/foot"

if [[ ${PV} == 9999 ]]
then
	EGIT_REPO_URI="https://codeberg.org/dnkl/foot"
	inherit git-r3
else
	SRC_URI="https://codeberg.org/dnkl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+grapheme-clustering +ime lto pgo +themes"

RDEPEND="
	dev-libs/wayland
	dev-util/wayland-scanner
	grapheme-clustering? ( media-libs/fcft[harfbuzz] )
	media-libs/fcft
	media-libs/fontconfig
	media-libs/freetype
	sys-libs/ncurses
	x11-libs/libxkbcommon
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/scdoc
	dev-libs/tllist
	dev-libs/wayland-protocols
	grapheme-clustering? ( dev-libs/libutf8proc )
	pgo? ( gui-wm/cage )
"

DOC=( "README.md" "CHANGELOG.md" "foot.ini" )
PATCHES=( "${FILESDIR}/foot-1.9.0-gentoo-fhs.patch" )

src_prepare() {
	default

	sed -i "s/@@PF@@/${PF}/" meson.build || die

	if use pgo
	then
		mkdir -p "${WORKDIR}/pgo/run" || die
		PGO_WORK_DIR="${WORKDIR}/pgo"
		export XDG_RUNTIME_DIR="${PGO_WORK_DIR}/run"

		WLR_BACKENDS=headless
		WLR_RENDERER=pixman
		export WLR_BACKENDS WLR_RENDERER

		render_cards=$(echo -n /dev/dri/render* | sed 's/ /:/g')
		addpredict "${render_cards}"

		BUILD_DIR="${WORKDIR}/${P}-build"
	fi
}

src_configure() {
	use pgo && tc-is-clang && append-cflags -Wno-ignored-optimization-argument

	local emesonargs=(
		-Dwerror=false
		-Dterminfo=disabled
		$(meson_feature grapheme-clustering)
		$(meson_use ime)
		$(meson_use lto b_lto)
		$(meson_use themes)
	)
	meson_src_configure

	if use pgo
	then
		old_pwd=$(pwd)
		cd "${BUILD_DIR}" || die

		meson configure -Db_pgo=generate || die
		eninja

		temp_file=${PGO_WORK_DIR}/temp
		./footclient --version || die "pgo failed"
		cage -- ./foot -c /dev/null -t xterm \
			--override tweak.grapheme-shaping=no \
			sh -c "${S}/scripts/generate-alt-random-writes.py \
			--scroll --scroll-region --colors-regular --colors-bright \
			--colors-256 --colors-rgb --attr-bold --attr-italic \
			--attr-underline --sixel ${temp_file} && cat ${temp_file}" || die "pgo failed"

		tc-is-clang && llvm-profdata merge default_*profraw --output=default.profdata
		meson configure -Db_pgo=use

		cd "${old_pwd}" || die
	fi
}

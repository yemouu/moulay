# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic meson ninja-utils toolchain-funcs xdg-utils

DESCRIPTION="A fast, lightweight and minimalistic Wayland terminal emulator"
HOMEPAGE="https://codeberg.org/dnkl/foot"
if [[ ${PV} == 9999 ]]
then
	EGIT_REPO_URI="https://codeberg.org/dnkl/foot"
	inherit git-r3
else
	SRC_URI="https://codeberg.org/dnkl/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+grapheme-clustering +ime lto pgo +terminfo"

RDEPEND="
	dev-libs/fcft
	dev-libs/wayland
	dev-util/wayland-scanner
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/libxkbcommon
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/scdoc
	grapheme-clustering? ( dev-libs/libutf8proc )
	dev-libs/tllist
	dev-libs/wayland-protocols
	pgo? ( dev-libs/weston[desktop,headless] )
	terminfo? ( sys-libs/ncurses )
"

DOC=( "README.md" "CHANGELOG.md" "foot.ini" )
PATCHES=(
	"${FILESDIR}/gentoo-fhs.patch"
	"${FILESDIR}/${P}-fix-pgo-clang-builds.patch"
)

pgo_die() {
	# kill weston in case of ebuild failure
	kill "$weston_pid"
	die "pgo failed"
}

src_prepare() {
	default

	if use pgo
	then
		mkdir -p "${WORKDIR}/pgo/run" || die
		PGO_WORK_DIR="${WORKDIR}/pgo"
		export XDG_RUNTIME_DIR="${PGO_WORK_DIR}/run"
		BUILD_DIR="${WORKDIR}/${P}-build"
	fi
}

src_configure() {
	use pgo && tc-is-clang && append-cflags -Wno-ignored-optimization-argument

	local emesonargs=(
		$(meson_use ime)
		$(meson_feature terminfo)
		$(meson_feature grapheme-clustering)
		$(meson_use lto b_lto)
	)
	meson_src_configure

	if use pgo
	then
		old_pwd=$(pwd)
		cd "${BUILD_DIR}" || die

		meson configure -Db_pgo=generate || die
		eninja

		weston -Bheadless-backend.so &
		weston_pid=$!
		sleep 1

		temp_file=${PGO_WORK_DIR}/temp
		./footclient --version || pgo_die
		./foot -c /dev/null -t xterm sh -c "${S}/scripts/generate-alt-random-writes.py \
			--scroll --scroll-region --colors-regular --colors-bright \
			--colors-256 --colors-rgb --attr-bold --attr-italic \
			--attr-underline --sixel ${temp_file} && cat ${temp_file}" || pgo_die

		tc-is-clang && llvm-profdata merge default_*profraw --output=default.profdata
		meson configure -Db_pgo=use

		cd "${old_pwd}" || die
		kill "${weston_pid}" || die
	fi
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="catnip gtk frontend"
HOMEPAGE="https://github.com/diamondburned/catnip-gtk"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/diamondburned/${PN}"

	src_unpack() {
		git-r3_src_unpack
		go-module_live_vendor
	}
else
	EGO_SUM=(
	)

	go-module_set_globals
	SRC_URI="
		${EGO_SUM_SRC_URI}
	"
	KEYWORDS="~amd64"
fi

LICENSE="BSD BSD-2 ISC LGPL-2.1 MIT"
SLOT="0"

RDEPEND="
	dev-libs/glib
	gui-libs/gtk-layer-shell
	gui-libs/libhandy:1
	media-libs/portaudio
	sci-libs/fftw
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}"

src_compile() {
	go build ./cmd/catnip-gtk || die
}

src_install() {
	einstalldocs
	dobin catnip-gtk
}

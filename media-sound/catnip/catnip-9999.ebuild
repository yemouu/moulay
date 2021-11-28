# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="terminal audio visualizer"
HOMEPAGE="https://github.com/noriah/catnip"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/noriah/${PN}"

	src_unpack() {
		git-r3_src_unpack
		go-module_live_vendor
	}
else
	EGO_SUM=(
	)

	go-module_set_globals

	SRC_URI="
		https://github.com/noriah/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}
	"
	KEYWORDS="~amd64"
fi

LICENSE="MIT Unlicense BSD-2"
SLOT="0"
IUSE="+portaudio"

RDEPEND="
	portaudio? ( media-libs/portaudio )
	sci-libs/fftw:3.0
"
DEPEND="${RDEPEND}"

src_compile() {
	go build $(usex portaudio "" "-tags noportaudio") || die
}

src_install() {
	einstalldocs
	dobin catnip
}

pkg_postinst() {
	einfo "The available backends for ${PN} include portaudio (default), alsa, and pulseaudio"
	einfo "For alsa support, install media-video/ffmpeg"
	einfo "For pulseaudio support, install media-sound/pulseaudio and optionally, media-video/ffmpeg"
}

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module optfeature

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
IUSE="portaudio +fftw"

RDEPEND="
	fftw? ( sci-libs/fftw:3.0 )
	portaudio? ( media-libs/portaudio )
"
DEPEND="${RDEPEND}"

src_compile() {
	go_tags="-tags "
	use fftw && go_tags="${go_tags}withfftw,"
	use portaudio && go_tags="${go_tags}withportaudio"
	go_tags=${go_tags%,}
	go_tags=${go_tags%-tags }

	go build $go_tags || die
}

src_install() {
	einstalldocs
	dobin catnip
}

pkg_postinst() {
	optfeature "use ffmpeg backends" media-video/ffmpeg
	optfeature "use pulseaudio backend with parec" media-sound/pulseaudio
}

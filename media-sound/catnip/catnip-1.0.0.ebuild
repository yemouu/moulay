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
		"github.com/ajstarks/svgo v0.0.0-20180226025133-644b8db467af/go.mod"
		"github.com/fogleman/gg v1.2.1-0.20190220221249-0403632d5b90/go.mod"
		"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0/go.mod"
		"github.com/integrii/flaggy v1.4.4"
		"github.com/integrii/flaggy v1.4.4/go.mod"
		"github.com/jung-kurt/gofpdf v1.0.3-0.20190309125859-24315acbbda5/go.mod"
		"github.com/lawl/pulseaudio v0.0.0-20200802093727-ab0735955fd0"
		"github.com/lawl/pulseaudio v0.0.0-20200802093727-ab0735955fd0/go.mod"
		"github.com/mattn/go-runewidth v0.0.9"
		"github.com/mattn/go-runewidth v0.0.9/go.mod"
		"github.com/nsf/termbox-go v0.0.0-20200418040025-38ba6e5628f1"
		"github.com/nsf/termbox-go v0.0.0-20200418040025-38ba6e5628f1/go.mod"
		"github.com/pkg/errors v0.9.1"
		"github.com/pkg/errors v0.9.1/go.mod"
		"golang.org/x/exp v0.0.0-20180321215751-8460e604b9de/go.mod"
		"golang.org/x/exp v0.0.0-20180807140117-3d87b88a115f/go.mod"
		"golang.org/x/exp v0.0.0-20190125153040-c74c464bbbf2"
		"golang.org/x/exp v0.0.0-20190125153040-c74c464bbbf2/go.mod"
		"golang.org/x/image v0.0.0-20180708004352-c73c2afc3b81/go.mod"
		"golang.org/x/tools v0.0.0-20180525024113-a5b4c53f6e8b/go.mod"
		"golang.org/x/tools v0.0.0-20190206041539-40960b6deb8e/go.mod"
		"gonum.org/v1/gonum v0.0.0-20180816165407-929014505bf4/go.mod"
		"gonum.org/v1/gonum v0.8.1"
		"gonum.org/v1/gonum v0.8.1/go.mod"
		"gonum.org/v1/netlib v0.0.0-20190313105609-8cb42192e0e0"
		"gonum.org/v1/netlib v0.0.0-20190313105609-8cb42192e0e0/go.mod"
		"gonum.org/v1/plot v0.0.0-20190515093506-e2840ee46a6b/go.mod"
		"rsc.io/pdf v0.1.1/go.mod"
	)

	go-module_set_globals

	SRC_URI="https://github.com/noriah/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT Unlicense BSD-2"
SLOT="0"

RDEPEND="
	media-libs/portaudio
	sci-libs/fftw:3.0
"
DEPEND="${RDEPEND}"

src_compile() {
	go build || die
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

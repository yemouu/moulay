# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/mlvzk/piko"
EGO_VENDOR=(
	"github.com/PuerkitoBio/goquery v1.5.0"
	"github.com/andybalholm/cascadia v1.0.0"
	"golang.org/x/net fa69b94a3b58 github.com/golang/net"
	"github.com/kylelemons/godebug v1.1.0"
	"github.com/mlvzk/qtils v0.4.1"
	"gopkg.in/cheggaaa/pb.v1 v1.0.28 github.com/cheggaaa/pb"
	"github.com/mattn/go-runewidth v0.0.4"
	"golang.org/x/sys 8097e1b27ff5 github.com/golang/sys"
)

inherit golang-vcs-snapshot

DESCRIPTION="Light and simple media downloader."
HOMEPAGE="https://github.com/mlvzk/piko"
SRC_URI="https://github.com/mlvzk/piko/archive/v${PV}.tar.gz -> ${P}.tar.gz
${EGO_VENDOR_URI}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}"

src_compile() {
	export GOPATH="${S}:$(get_golibdir_gopath)"
	cd src/${EGO_PN} || die
	go build -ldflags="-s -w" -v -x -o "bin/piko" cmd/piko/* || die "build failed"
}

src_install() {
	dobin src/${EGO_PN}/bin/piko
}

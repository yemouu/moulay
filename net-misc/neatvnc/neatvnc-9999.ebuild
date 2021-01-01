# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A liberally licensed VNC server library with a clean interface"
HOMEPAGE="https://github.com/any1/neatvnc"

if [[ ${PV} = 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/any1/${PN}"
else
	SRC_URI="https://github.com/any1/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="ISC"
SLOT="0"
IUSE="+gnutls +jpeg"

RDEPEND="
	dev-libs/aml
	gnutls? ( net-libs/gnutls )
	jpeg? ( media-libs/libjpeg-turbo )
	sys-libs/zlib
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="x11-libs/libdrm"

src_configure() {
	local emesonargs=(
		-Djpeg=$(usex jpeg enabled disabled)
		-Dtls=$(usex gnutls enabled disabled)
	)
	meson_src_configure
}

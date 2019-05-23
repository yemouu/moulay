# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Window rule daemon"
HOMEPAGE="https://github.com/tudurom/ruler"
SRC_URI="https://github.com/tudurom/${PN}/archive/v${PV}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libxcb
	x11-libs/xcb-util-wm
	x11-libs/libwm"
RDEPEND="${DEPEND}"
BDEPEND="virtual/yacc
	sys-devel/flex"

PATCHES=("${FILESDIR}/${PN}-Makefile.patch")

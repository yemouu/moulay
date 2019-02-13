# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Stacking window manager that cooks windows with orders from the Waitron"
HOMEPAGE="https://tudorr.ro/software/windowchef/"
SRC_URI="https://github.com/tudurom/${PN}/archive/v${PV}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
x11-libs/libxcb
x11-libs/xcb-util-wm
x11-libs/xcb-util-keysyms
"
RDEPEND="${DEPEND}"
BDEPEND="
x11-base/xorg-proto"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
	mv "${D}/usr/share/doc/${PN}" "${D}/usr/share/doc/${P}"
}


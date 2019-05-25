# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A small library for X windows manipulation"
HOMEPAGE="https://github.com/wmutils/libwm"
SRC_URI="https://github.com/wmutils/${PN}/archive/v${PV}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="events"

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply "${FILESDIR}/${PN}-Makefile.patch"
	use events && eapply "${FILESDIR}/${PN}-register-events.patch"
	eapply_user
}

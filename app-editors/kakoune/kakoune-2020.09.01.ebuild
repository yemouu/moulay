# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Modal editor inspired by vim"
HOMEPAGE="http://kakoune.org"
SRC_URI="https://github.com/mawww/${PN}/archive/v${PV}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-libs/ncurses:0=[unicode]"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/kakoune-2020.01.16-enable-ebuild-syntax-highlight.patch )

src_prepare(){
	default
	sed -i '/CXXFLAGS += -O3/d' src/Makefile || die
}

src_compile() {
	cd src/ || die
	emake all
}

src_test() {
	cd src/ || die
	emake test
}

src_install() {
	emake PREFIX="${D}"/usr docdir="${D}/usr/share/doc/${PF}" gzip_man="no" install

	#rm "${D}/usr/share/man/man1/kak.1.gz" || die
	#doman doc/kak.1
}

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Andri's Main Loop"
HOMEPAGE="https://github.com/any1/aml"

if [[ ${PV} = 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/any1/${PN}"
else
	SRC_URI="https://github.com/any1/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="ISC"
SLOT="0"

src_prepare() {
	default
	usex elibc_musl && sed -i '/#include <sys\/cdefs.h>/d' include/sys/queue.h
}

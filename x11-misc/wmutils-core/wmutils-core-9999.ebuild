# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

GIT_PN="${PN:8}"
DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"
EGIT_REPO_URI="${HOMEPAGE} -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=("${FILESDIR}/${PN}-MANPREFIX.patch")

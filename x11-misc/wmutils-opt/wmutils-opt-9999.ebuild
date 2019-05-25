# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

GIT_PN="${PN:8}"
DESCRIPTION="optional addons to wmutils"
HOMEPAGE="https://github.com/wmutils/opt"
EGIT_REPO_URI="https://github.com/wmutils/${GIT_PN}"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

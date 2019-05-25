# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_PN="${PN:8}"
DESCRIPTION="optional addons to wmutils"
HOMEPAGE="https://github.com/wmutils/opt"
SRC_URI="https://github.com/wmutils/${GIT_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${GIT_PN}-${PV}"

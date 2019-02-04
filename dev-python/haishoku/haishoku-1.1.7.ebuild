# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{4,5,6,7} )
inherit distutils-r1

DESCRIPTION="Grabs the dominant color or representative color palette from an image"
HOMEPAGE="https://github.com/LanceGin/haishoku"
SRC_URI="https://github.com/LanceGin/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/pillow"
RDEPEND="${DEPEND}"
BDEPEND=""

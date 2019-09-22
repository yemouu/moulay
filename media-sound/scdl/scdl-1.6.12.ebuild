# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Soundcloud Music Downloader"
HOMEPAGE="https://github.com/flyingrub/scdl"
COMMIT="aaf64be7a27dad113e037be79a0079d430604e88"
SRC_URI="https://github.com/flyingrub/scdl/archive/${COMMIT}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/docopt[${PYTHON_USEDEP}]
	media-libs/mutagen[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/clint[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${COMMIT}"

PATCHES=( "${FILESDIR}/scdl-xdg.patch" )

# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Soundcloud Music Downloader."
HOMEPAGE="https://github.com/flyingrub/scdl"
COMMIT="30968bc5a19703fcf3332613f96e497e43bd6771"
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

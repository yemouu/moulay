# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7,8} )

inherit distutils-r1

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="API wrapper for Discord written in Python."
HOMEPAGE="https://github.com/Rapptz/discord.py"
SRC_URI="https://github.com/Rapptz/discord.py/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="voice"

S="${WORKDIR}/${MY_P}"

RDEPEND=">=dev-python/aiohttp-3.6.0[${PYTHON_USEDEP}]
	<dev-python/aiohttp-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-6.0[${PYTHON_USEDEP}]
	<dev-python/websockets-7.0[${PYTHON_USEDEP}]
	voice? ( =dev-python/pynacl-1.3.0[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}"

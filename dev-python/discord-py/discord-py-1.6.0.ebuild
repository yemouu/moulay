# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )
inherit distutils-r1

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="API wrapper for Discord written in Python"
HOMEPAGE="https://github.com/Rapptz/discord.py"
if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Rapptz/discord.py"
else
	SRC_URI="https://github.com/Rapptz/discord.py/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="voice"

RDEPEND="
	dev-libs/libffi
	>=dev-python/aiohttp-3.6.0[${PYTHON_USEDEP}]
	<dev-python/aiohttp-3.7.0[${PYTHON_USEDEP}]
	voice? ( dev-python/pynacl[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}"

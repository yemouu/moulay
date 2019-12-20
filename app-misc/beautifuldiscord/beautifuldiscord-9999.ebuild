# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )
inherit distutils-r1 git-r3

DESCRIPTION="Adds custom CSS support to Discord."
HOMEPAGE="https://github.com/leovoel/BeautifulDiscord"
EGIT_REPO_URI="https://github.com/leovoel/BeautifulDiscord"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/psutil[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

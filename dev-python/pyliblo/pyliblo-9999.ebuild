# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11} )
inherit distutils-r1

DESCRIPTION="Python bindings for the liblo OSC library"
HOMEPAGE="http://das.nasophon.de/pyliblo"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dsacre/${PN}"
else
	SRC_URI="http://das.nasophon.de/download/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-2.1"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	media-libs/liblo
"
DEPEND="${RDEPEND}"

distutils_enable_tests setup.py

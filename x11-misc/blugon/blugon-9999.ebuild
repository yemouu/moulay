# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{4,5,6,7} )

inherit git-r3 python-r1

EGIT_REPO_URI="https://github.com/jumper149/blugon"

DESCRIPTION="A simple Blue Light Filter for X"
HOMEPAGE="https://github.com/jumper149/blugon"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="xgamma"

DEPEND="x11-libs/libX11
	x11-libs/libXrandr
	xgamma? ( x11-apps/xgamma )"
RDEPEND="${DEPEND}"
BDEPEND=""

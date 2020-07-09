# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit python-r1

DESCRIPTION="A simple Blue Light Filter for X"
HOMEPAGE="https://github.com/jumper149/blugon"
SRC_URI="https://github.com/jumper149/${PN}/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xgamma"

DEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	xgamma? ( x11-apps/xgamma )
"
RDEPEND="${DEPEND}"

PATCHES=( ${FILESDIR}/${PN}-no-manpage-compression.patch )

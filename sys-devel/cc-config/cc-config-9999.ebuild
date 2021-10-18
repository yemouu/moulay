# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Utility to control symlinks for cc, c++, and friends"
HOMEPAGE="https://gitlab.com/yemou/cc-config"

if [[ ${PV} == 9999  ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/yemou/cc-config"
else
	SRC_URI="https://gitlab.com/yemou/cc-config"
	KEYWORDS="~amd64"
fi

LICENSE="Unlicense"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "s/@VERSION@/${PV}/g" cc-config
}

src_install() {
	einstalldocs
	dobin cc-config
}

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Typed Linked List C header file only library"
HOMEPAGE="https://codeberg.org/dnkl/tllist"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://codeberg.org/dnkl/${PN}"
else
	SRC_URI="https://codeberg.org/dnkl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

PATCHES=( "${FILESDIR}/gentoo-fhs.patch" )

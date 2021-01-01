# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Desktop notifications, the UNIX way"
HOMEPAGE="https://github.com/Sweets/tiramisu"

if [[ ${PV} = 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Sweets/${PN}"
else
	SRC_URI="https://github.com/Sweets/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-libs/glib"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}

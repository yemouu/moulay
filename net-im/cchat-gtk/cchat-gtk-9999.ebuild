# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Gtk frontend for cchat"
HOMEPAGE="https://github.com/diamondburned/cchat-gtk"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/diamondburned/${PN}"

	src_unpack() {
		git-r3_src_unpack
		go-module_live_vendor
	}
else
	EGO_SUM=(
	)

	go-module_set_globals

	SRC_URI="
		https://github.com/diamondburned/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}
	"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0 BSD BSD-2 GPL-3 ISC LGPL-2 MIT"
SLOT="0"

RDEPEND="
	app-text/gspell
	gui-libs/libhandy:1
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}"

src_install() {
	einstalldocs
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}

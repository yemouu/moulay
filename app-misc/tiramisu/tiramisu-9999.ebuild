# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 savedconfig

DESCRIPTION="Desktop notifications, the UNIX way"
HOMEPAGE="https://github.com/Sweets/tiramisu"
EGIT_REPO_URI="https://github.com/Sweets/tiramisu"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/glib"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
	save_config config.h
}
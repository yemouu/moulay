# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Bash only text editor"
HOMEPAGE="https://github.com/trvv/bed"
EGIT_REPO_URI="https://github.com/comfies/${PN}"

LICENSE="Unlicense"
SLOT="0"

RDEPEND="app-shells/bash:*"
DEPEND="${RDEPEND}"

src_install() {
	dobin bed
	einstalldocs
}

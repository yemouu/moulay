# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
"

inherit cargo

DESCRIPTION="An implementation of the Language Server Protocol for LaTeX"
HOMEPAGE="https://texlab.netlify.app"
if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/latex-lsp/${PN}"
else
	SRC_URI="
		https://github.com/latex-lsp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris $CRATES)
	"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

src_unpack() {
	if [[ ${PV} == 9999 ]]
	then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

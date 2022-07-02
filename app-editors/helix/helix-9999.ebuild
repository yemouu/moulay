# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

inherit cargo

DESCRIPTION="A post-modern modal text editor"
HOMEPAGE="https://helix-editor.com/"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/helix-editor/${PN}"

	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}
else
	SRC_URI="
		https://github.com/helix-editor/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris "${CRATES}")
	"
	KEYWORDS="~amd64"
fi

LICENSE="MPL-2.0"
SLOT="0"

src_compile() {
	export HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1
	cargo_src_compile
}

src_install() {
	cargo_src_install --path helix-term
}

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

RDEPEND="dev-libs/tree-sitter"
DEPEND="${RDEPEND}"

src_compile() {
	export HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1
	cargo_src_compile
}

src_install() {
	insinto /usr/share/helix
	doins -r runtime

	cargo_src_install --path helix-term
}

pkg_postinst() {
	elog "You will need to copy /usr/share/helix/runtime into your \$HELIX_RUNTIME"
	elog "For syntax highlighting and other features. "
	elog ""
	elog "Run: "
	elog "cp -r /usr/share/helix/runtime ~/.config/helix/runtime"
	elog ""
	elog "To install tree-sitter grammars for helix run the following:"
	elog "hx -g fetch"
	elog "hx -g build"
}

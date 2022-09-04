# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
"

inherit cargo

DESCRIPTION="Kakoune Language Server Protocol Client"
HOMEPAGE="https://github.com/kak-lsp/kak-lsp"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/kak-lsp/${PN}"

	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}
else
	SRC_URI="
		https://github.com/kak-lsp/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris $CRATES)
	"
	KEYWORDS="~amd64"
fi

LICENSE="Unlicense MIT"
SLOT="0"

src_install() {
	insinto /usr/share/${PN}/examples
	doins ${PN}.toml

	insinto /usr/share/${PN}/rc
	doins rc/lsp.kak

	cargo_src_install
}

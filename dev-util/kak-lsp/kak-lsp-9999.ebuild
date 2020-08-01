# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
"

inherit cargo

DESCRIPTION="Kakoune Language Server Protocol Client"
HOMEPAGE="https://github.com/ul/kak-lsp"
if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ul/${PN}"
else
	SRC_URI="
		https://github.com/ul/${PN}/archive/v${PV}.tar.gz
		$(cargo_crate_uris $CRATES)
	"
	KEYWORDS="~amd64"
fi

LICENSE="Unlicense MIT"
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

src_install() {
	insinto /usr/share/${PN}/examples
	doins ${PN}.toml

	insinto /usr/share/${PN}/rc
	doins rc/lsp.kak

	cargo_src_install
}

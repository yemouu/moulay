# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/"

if [[ "${PV}" == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rust-lang/${PN}"

	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}
else
	MY_PV="${PV//./-}"
	SRC_URI="
		https://github.com/rust-lang/${PN}/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris $CRATES)
	"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${MY_PV}"
fi

LICENSE="Apache-2.0 MIT"
SLOT="0"
RESTRICT=mirror

RDEPEND="dev-lang/rust[rust-src]"
DEPEND="${RDEPEND}"

src_install() {
	cargo_src_install --path "crates/rust-analyzer"
}

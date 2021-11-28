# Copyright 1999-2021 Gentoo Authors
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
	SUBMODULES="
	"

	_git_submodules() {
		while read -r submodule
		do
			[[ $submodule =~ .*:.* ]] || continue

			url=${submodule%%:*}
			commit=${submodule#*:}
			commit="${commit%:*}"

			full_url="https://${url}/archive/${commit}.tar.gz -> ${P}_${url##*/}-${commit}.tar.gz"
			printf '%s\n' "${full_url}"
		done <<-EOF
			"${SUBMODULES}"
		EOF
	}

	SRC_URI="
		https://github.com/helix-editor/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris "${CRATES}")
		$(_git_submodules)
	"
	KEYWORDS="~amd64"

	src_prepare() {
		while read -r submodule
		do
			[[ $submodule =~ .*:.* ]] || continue

			url=${submodule%%:*}
			commit=${submodule#*:}
			commit="${commit%:*}"
			path="${submodule##*:}"

			rm -r "${path:?}/${url##*/}" || die
			mv "../${url##*/}-${commit}" "${path}/${url##*/}" || die
		done <<-EOF
			${SUBMODULES}
		EOF

		default
	}
fi

LICENSE="MPL-2.0"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${P}-helix-core_src_lib.patch" )

src_configure() {
	sed -i "s!%%DATADIR%%!${EPREFIX}/usr/share/helix!" helix-core/src/lib.rs || die
}

src_install() {
	insinto /usr/share/helix
	doins -r runtime

	cargo_src_install --path helix-term
}

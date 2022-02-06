# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Zig LSP implementation + Zig Language Server"
HOMEPAGE="https://github.com/zigtools/zls"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zigtools/${PN}"
else
	KNOWN_FOLDERS_COMMIT="9db1b99219c767d5e24994b1525273fe4031e464"
	ZINPUT_COMMIT="5e0d781eee025cfea271dd10c1939d201fe4fd25"
	SRC_URI="
		https://github.com/ziglibs/known-folders/archive/${KNOWN_FOLDERS_COMMIT}.tar.gz -> ${P}-known-folders-${KNOWN_FOLDERS_COMMIT}.tar.gz
		https://github.com/ziglibs/zinput/archive/$ZINPUT_COMMIT.tar.gz -> ${P}-zinput-${ZINPUT_COMMIT}.tar.gz
		https://github.com/zigtools/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	"
	KEYWORDS="~amd64"

	src_prepare() {
		rm -r src/known-folders || die
		mv "../known-folders-${KNOWN_FOLDERS_COMMIT}" src/known-folders || die
		rm -r src/zinput || die
		mv "../zinput-${ZINPUT_COMMIT}" src/zinput || die

		default
	}
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-lang/zig-0.9.0
	<dev-lang/zig-0.10.0
"

src_compile() {
	zig build -Drelease-safe=true --verbose || die "Compilation failed"
}

src_install() {
	dobin zig-out/bin/zls
}

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Zig LSP implementation + Zig Language Server"
HOMEPAGE="https://github.com/zigtools/zls"

KFOLDERS_COMMIT="24845b0103e611c108d6bc334231c464e699742c"
TRACY_COMMIT="f493d4aa8ba8141d9680473fad007d8a6348628e"
SRC_URI="
	https://github.com/ziglibs/known-folders/archive/${KFOLDERS_COMMIT}.tar.gz -> known-folders-${KFOLDERS_COMMIT}.tar.gz
	https://github.com/wolfpld/tracy/archive/${TRACY_COMMIT}.tar.gz -> tracy-${TRACY_COMMIT}.tar.gz
	https://github.com/zigtools/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
"
KEYWORDS="~amd64"

src_prepare() {
	rm -r src/known-folders || die
	mv "../known-folders-${KFOLDERS_COMMIT}" src/known-folders || die
	rm -r src/tracy || die
	mv "../tracy-${TRACY_COMMIT}" src/zinput || die

	default
}

LICENSE="MIT"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	|| (
		(
			>=dev-lang/zig-bin-0.10.0
			<dev-lang/zig-bin-0.11.0
		)
		(
			>=dev-lang/zig-0.10.0
			<dev-lang/zig-0.11.0
		)
	)
"

src_compile() {
	zig build -Drelease-safe=true || die "Compilation failed"
}

src_install() {
	dobin zig-out/bin/zls
}

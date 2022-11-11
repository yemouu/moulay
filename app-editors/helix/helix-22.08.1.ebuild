# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
aho-corasick-0.7.18
android_system_properties-0.1.5
anyhow-1.0.63
arc-swap-1.5.1
autocfg-1.1.0
bitflags-1.3.2
bstr-0.2.17
bumpalo-3.11.0
bytecount-0.6.3
bytes-1.2.1
cassowary-0.3.0
cc-1.0.73
cfg-if-1.0.0
chardetng-0.1.17
chrono-0.4.22
clipboard-win-4.4.2
content_inspector-0.2.4
core-foundation-sys-0.8.3
crossbeam-utils-0.8.11
crossterm-0.25.0
crossterm_winapi-0.9.0
dirs-next-2.0.0
dirs-sys-next-0.1.2
either-1.8.0
encoding_rs-0.8.31
encoding_rs_io-0.1.7
error-code-2.3.1
etcetera-0.4.0
fastrand-1.8.0
fern-0.6.1
fnv-1.0.7
form_urlencoded-1.0.1
futures-core-0.3.24
futures-executor-0.3.24
futures-task-0.3.24
futures-util-0.3.24
fuzzy-matcher-0.3.7
getrandom-0.2.7
globset-0.4.9
grep-matcher-0.1.5
grep-regex-0.1.10
grep-searcher-0.1.10
hermit-abi-0.1.19
iana-time-zone-0.1.47
idna-0.2.3
ignore-0.4.18
indoc-1.0.7
instant-0.1.12
itoa-1.0.3
js-sys-0.3.59
lazy_static-1.4.0
libc-0.2.132
libloading-0.7.3
lock_api-0.4.8
log-0.4.17
lsp-types-0.93.1
matches-0.1.9
memchr-2.5.0
memmap2-0.5.7
mio-0.8.4
num-integer-0.1.45
num-traits-0.2.15
num_cpus-1.13.1
once_cell-1.13.1
parking_lot-0.12.1
parking_lot_core-0.9.3
percent-encoding-2.1.0
pin-project-lite-0.2.9
pin-utils-0.1.0
proc-macro2-1.0.43
pulldown-cmark-0.9.2
quickcheck-1.0.3
quote-1.0.21
rand-0.8.5
rand_core-0.6.3
redox_syscall-0.2.16
redox_users-0.4.3
regex-1.6.0
regex-automata-0.1.10
regex-syntax-0.6.27
remove_dir_all-0.5.3
retain_mut-0.1.9
ropey-1.5.0
ryu-1.0.11
same-file-1.0.6
scopeguard-1.1.0
serde-1.0.144
serde_derive-1.0.144
serde_json-1.0.85
serde_repr-0.1.9
signal-hook-0.3.14
signal-hook-mio-0.2.3
signal-hook-registry-1.4.0
signal-hook-tokio-0.3.1
similar-2.2.0
slab-0.4.7
slotmap-1.0.6
smallvec-1.9.0
smartstring-1.0.1
smawk-0.3.1
socket2-0.4.7
static_assertions-1.1.0
str-buf-1.0.6
str_indices-0.4.0
syn-1.0.99
tempfile-3.3.0
textwrap-0.15.0
thiserror-1.0.33
thiserror-impl-1.0.33
thread_local-1.1.4
threadpool-1.8.1
tinyvec-1.6.0
tinyvec_macros-0.1.0
tokio-1.20.1
tokio-macros-1.8.0
tokio-stream-0.1.9
toml-0.5.9
tree-sitter-0.20.8
unicase-2.6.0
unicode-bidi-0.3.8
unicode-general-category-0.5.1
unicode-ident-1.0.3
unicode-linebreak-0.1.2
unicode-normalization-0.1.21
unicode-segmentation-1.9.0
unicode-width-0.1.9
url-2.2.2
version_check-0.9.4
walkdir-2.3.2
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.82
wasm-bindgen-backend-0.2.82
wasm-bindgen-macro-0.2.82
wasm-bindgen-macro-support-0.2.82
wasm-bindgen-shared-0.2.82
which-4.3.0
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.36.1
windows_aarch64_msvc-0.36.1
windows_i686_gnu-0.36.1
windows_i686_msvc-0.36.1
windows_x86_64_gnu-0.36.1
windows_x86_64_msvc-0.36.1
"

inherit cargo

DESCRIPTION="A post-modern modal text editor"
HOMEPAGE="https://helix-editor.com/"

SRC_URI="
	https://github.com/helix-editor/${PN}/releases/download/${PV}/${P}-source.tar.xz -> ${P}.tar.xz
	$(cargo_crate_uris "${CRATES}")
"
KEYWORDS="~amd64"
S="${WORKDIR}"

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

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler32-1.0.4
aho-corasick-0.7.6
ansi_term-0.11.0
arc-swap-0.3.11
arrayref-0.3.5
arrayvec-0.4.11
atty-0.2.13
autocfg-0.1.6
backtrace-0.3.38
backtrace-sys-0.1.31
base64-0.10.1
bitflags-1.2.0
blake2b_simd-0.5.8
boxfnonce-0.1.1
byteorder-1.3.2
c2-chacha-0.2.2
cc-1.0.45
cfg-if-0.1.10
chrono-0.4.9
clap-2.33.0
cloudabi-0.0.3
constant_time_eq-0.1.4
crc32fast-1.2.0
crossbeam-0.2.12
crossbeam-channel-0.3.9
crossbeam-utils-0.6.6
daemonize-0.4.1
dirs-1.0.5
dirs-2.0.2
dirs-sys-0.3.4
either-1.5.3
enum_primitive-0.1.1
failure-0.1.5
failure_derive-0.1.5
fuchsia-cprng-0.1.1
futures-0.1.29
getrandom-0.1.12
glob-0.3.0
idna-0.1.5
itertools-0.8.0
itoa-0.4.4
jsonrpc-core-13.2.0
lazy_static-1.4.0
libc-0.2.62
libflate-0.1.27
log-0.3.9
log-0.4.8
lsp-types-0.59.0
matches-0.1.8
memchr-2.2.1
nodrop-0.1.13
num-derive-0.2.5
num-integer-0.1.41
num-traits-0.1.43
num-traits-0.2.8
percent-encoding-1.0.1
ppv-lite86-0.2.5
proc-macro2-0.4.30
proc-macro2-1.0.4
quote-0.6.13
quote-1.0.2
rand-0.7.2
rand_chacha-0.2.1
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.2.0
rand_os-0.1.3
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.1
regex-1.3.1
regex-syntax-0.6.12
rle-decode-fast-1.0.1
ropey-1.1.0
rust-argon2-0.5.1
rustc-demangle-0.1.16
ryu-1.0.0
serde-1.0.101
serde_derive-1.0.101
serde_json-1.0.40
slog-2.5.2
slog-async-2.3.0
sloggers-0.3.4
slog-kvfilter-0.7.0
slog-scope-4.1.2
slog-stdlog-3.0.5
slog-term-2.4.1
smallvec-0.6.10
strsim-0.8.0
syn-0.15.44
syn-1.0.5
synstructure-0.10.2
take_mut-0.2.2
term-0.5.2
textwrap-0.11.0
thread_local-0.3.6
time-0.1.42
toml-0.5.3
trackable-0.2.23
trackable_derive-0.1.2
unicode-bidi-0.3.4
unicode-normalization-0.1.8
unicode-width-0.1.6
unicode-xid-0.1.0
unicode-xid-0.2.0
url-1.7.2
url_serde-0.2.0
vec_map-0.8.1
wasi-0.7.0
whoami-0.5.3
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Kakoune Language Server Protocol Client."
HOMEPAGE="https://github.com/ul/kak-lsp"
SRC_URI="https://github.com/ul/${PN}/archive/v${PV}.tar.gz
	$(cargo_crate_uris $CRATES)"

LICENSE="Unlicense MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/${PN}/examples
	doins ${PN}.toml

	insinto /usr/share/${PN}/rc
	doins rc/lsp.kak

	cargo_src_install
}

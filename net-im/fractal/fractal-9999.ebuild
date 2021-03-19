# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
"

inherit cargo gnome2-utils meson xdg-utils

DESCRIPTION="Matrix messaging app for GNOME written in Rust"
HOMEPAGE="https://wiki.gnome.org/Apps/Fractal"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.gnome.org/GNOME/fractal"
else
	SRC_URI="
		https://gitlab.gnome.org/GNOME/${PN}/-/archive/${PV}/${P}.tar.gz
		$(cargo_crate_uris $CRATES)
	"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	app-text/gspell
	dev-libs/glib
	|| ( dev-libs/openssl dev-libs/libressl )
	gui-libs/libhandy:1
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-base
	media-libs/gstreamer
	media-libs/gstreamer-editing-services
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/gtksourceview:4
"
DEPEND="${RDEPEND}"

PATCHES=( ${FILESDIR}/fractal-ebuild-sandbox.patch  )

src_unpack() {
	if [[ ${PV} == 9999 ]]
	then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_configure() {
	local emesonargs=(
		-Dprofile=$(usex debug 'development' 'default')
	)
	meson_src_configure
}

src_compile() {
	export CARGO_HOME="${ECARGO_HOME}"
	meson_src_compile
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_icon_cache_update
}

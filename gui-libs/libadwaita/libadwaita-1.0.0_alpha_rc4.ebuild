# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# vala doesn't support EAPI 8 yet
EAPI=7

VALA_USE_DEPEND=vapigen
inherit meson vala

MY_P=${P//_/.}
MY_P=${MY_P/rc/}
MY_PV=${PV//_/.}
MY_PV=${MY_PV/rc/}

DESCRIPTION="Building blocks for modern GNOME applications"
HOMEPAGE="https://gitlab.gnome.org/GNOME/libadwaita"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.gnome.org/GNOME/libadwaita"
else
	SRC_URI="https://gitlab.gnome.org/GNOME/${PN}/-/archive/${MY_PV}/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="examples gtk-doc inspector +introspection vala"
REQUIRED_USE="vala? ( introspection ) gtk-doc? ( introspection )"

RDEPEND="
	dev-libs/fribidi
	dev-libs/glib
	>=gui-libs/gtk-4.4.0:4[introspection?]
	introspection? ( dev-libs/gobject-introspection )
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-lang/sassc
	gtk-doc? ( dev-util/gi-docgen )
	vala? ( $(vala_depend) )
"

src_prepare() {
	default
	use vala && vala_src_prepare
	if use gtk-doc
	then sed -i "s/libadwaita-@0@'.format(apiversion)/${PF}'/" doc/meson.build || die
	fi
}

src_configure() {
	local emesonargs=(
		$(meson_use examples)
		$(meson_use gtk-doc gtk_doc)
		$(meson_use inspector)
		$(meson_feature introspection)
		$(meson_use vala vapi)
	)
	meson_src_configure
}

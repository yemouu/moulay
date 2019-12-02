# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg

DESCRIPTION="A small and simple X11 menu."
HOMEPAGE="https://github.com/johanmalm/jgmenu"
SRC_URI="https://github.com/johanmalm/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/cairo
	x11-libs/pango
	gnome-base/librsvg
	dev-libs/libxml2
	dev-libs/glib
	lxde-base/menu-cache"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${PN}-Makefile.patch" )

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Day/night gamma adjustments for Wayland compositors"
HOMEPAGE="https://git.sr.ht/~kennylevinsen/wlsunset"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~kennylevinsen/wlsunset"
else
	SRC_URI="https://git.sr.ht/~kennylevinsen/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	sed -i '/werror/d' meson.build
}

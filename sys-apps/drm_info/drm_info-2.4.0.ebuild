# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Small utility to dump info about DRM devices"
HOMEPAGE="https://gitlab.freedesktop.org/emersion/drm_info"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.freedesktop.org/emersion/${PN}"
else
	SRC_URI="https://gitlab.freedesktop.org/emersion/${PN}/-/releases/v${PV}/downloads/${P}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+pci"

RDEPEND="
	x11-libs/libdrm
	dev-libs/json-c
	pci? ( sys-apps/pciutils )
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature pci libpci)
	)
	meson_src_configure
}

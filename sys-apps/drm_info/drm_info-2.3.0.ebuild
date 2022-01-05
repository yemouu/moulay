# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Small utility to dump info about DRM devices"
HOMEPAGE="https://github.com/ascent12/drm_info"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ascent12/drm_info"
else
	SRC_URI="https://github.com/ascent12/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
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

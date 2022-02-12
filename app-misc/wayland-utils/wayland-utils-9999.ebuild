# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Display information about supported Wayland protocols"
HOMEPAGE="https://gitlab.freedesktop.org/wayland/wayland-utils"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.freedesktop.org/wayland/${PN}"
else
	SRC_URI="https://gitlab.freedesktop.org/wayland/${PN}/-/archive/${P}/${PN}-${P}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${P}"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
"
DEPEND="${RDEPEND}"

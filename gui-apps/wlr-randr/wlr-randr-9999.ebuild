# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="An xrandr clone for wlroots compositors"
HOMEPAGE="https://github.com/emersion/wlr-randr"
if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/emersion/wlr-randr"
else
	SRC_URI="https://github.com/emersion/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-libs/wayland"
DEPEND="${RDEPEND}"

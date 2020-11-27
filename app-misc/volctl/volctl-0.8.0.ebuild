# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=bdepend
PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1 gnome2-utils

DESCRIPTION="Volume control for GNU/Linux desktops featuring per-app sliders"
HOMEPAGE="https://buzz.github.io/volctl"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/buzz/${PN}"
else
	SRC_URI="https://github.com/buzz/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND="
	dev-python/pygobject:3
	media-sound/pulseaudio
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}

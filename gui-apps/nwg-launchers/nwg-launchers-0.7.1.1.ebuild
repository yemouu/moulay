# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="GTK-based launchers for sway and other window managers"
HOMEPAGE="https://github.com/nwg-piotr/nwg-launchers"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nwg-piotr/${PN}"
else
	SRC_URI="https://github.com/nwg-piotr/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="+bar +dmenu +grid +layer-shell"
REQUIRED_USE="|| ( bar dmenu grid )"

RDEPEND="
	dev-cpp/gtkmm:3.0
	dev-cpp/nlohmann_json
	gui-libs/gtk-layer-shell
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature layer-shell)
		$(meson_use bar)
		$(meson_use dmenu)
		$(meson_use grid)
	)
	meson_src_configure
}

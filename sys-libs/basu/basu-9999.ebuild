# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="The sd-bus library, extracted from systemd"
HOMEPAGE="https://github.com/emersion/basu"
if [[ ${PV} == 9999 ]]
then
	EGIT_REPO_URI="https://github.com/emersion/basu"
	inherit git-r3
else
	SRC_URI="https://github.com/emersion/basu/releases/download/v${PV}/${P}.tar.gz"
	KEYWORDS=""
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="audit"

RDEPEND="
	audit? ( sys-process/audit )
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_use audit)
	)
	meson_src_configure
}

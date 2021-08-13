# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
"

inherit cargo

DESCRIPTION="A modern Volume Mixer for PulseAudio"
HOMEPAGE="https://myxer.aurailus.com/"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Aurailus/${PN}"
else
	SRC_URI="
		https://github.com/Aurailus/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris $CRATES)
	"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${P/m/M}"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	media-sound/pulseaudio
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}"

src_unpack() {
	if [[ ${PV} == 9999 ]]
	then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

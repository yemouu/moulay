# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop unpacker xdg

DESCRIPTION="Remotely connect to a gaming pc for a low latency remote computing experience"
HOMEPAGE="https://parsecgaming.com/"
SRC_URI="https://s3.amazonaws.com/parsec-build/package/parsec-linux.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE="vaapi"

DEPEND="sys-libs/glibc
	sys-devel/gcc:*
	media-libs/mesa
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXxf86vm
	vaapi? ( x11-libs/libva )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/"

QA_PREBUILT="
	opt/parsec/parsecd
	opt/parsec/parsec/skel/parsecd-147-9.so
"

src_install() {
	PARSEC_USR_BIN="usr/bin"
	PARSEC_USR_SHARE="usr/share"
	PARSEC_HOME="/opt/parsec"

	insinto /usr/share/icons/hicolor/256x256/apps
	doins "${PARSEC_USR_SHARE}/icons/hicolor/256x256/apps/parsec.png"
	domenu "${S}${PARSEC_USR_SHARE}/applications/parsec.desktop"

	insinto "${PARSEC_HOME}"
	doins -r "${PARSEC_USR_SHARE}/parsec"
	doins "${PARSEC_USR_BIN}/parsecd"
	fperms +x "${PARSEC_HOME}/parsecd"

	dosym ../../opt/parsec/parsecd usr/bin/parsecd
}

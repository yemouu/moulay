# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker desktop xdg-utils

DESCRIPTION="Video Conferencing and Web Conferencing Service."
HOMEPAGE="https://www.zoom.us"
SRC_URI="https://zoom.us/client/${PV}/${PN}_amd64.deb -> ${P}_amd64.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="app-i18n/ibus
	dev-db/sqlite
	dev-libs/glib
	dev-libs/libxslt
	dev-qt/qt3d[gamepad,qml]
	dev-qt/qtconcurrent
	dev-qt/qtdeclarative
	dev-qt/qtgui[eglfs]
	dev-qt/qtmultimedia
	dev-qt/qtquickcontrols2
	dev-qt/qtsql
	dev-qt/qtxmlpatterns
	media-libs/fontconfig
	media-libs/mesa
	media-sound/pulseaudio
	sys-apps/dbus
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms"
DEPEND="${RDEPEND}"
BDEPEND="dev-util/patchelf"

PATCHES=("${FILESDIR}/zoom-desktop.patch")

S="${WORKDIR}"

QA_PREBUILT="opt/.*"
QA_EXECSTACK="opt/zoom/zoom
	opt/zoom/libQt5WebEngineCore.so.5.9.6"

src_prepare() {
	gzip -d usr/share/doc/zoom/changelog.gz
	patchelf --set-rpath '$ORIGIN' opt/zoom/platforminputcontexts/libfcitxplatforminputcontextplugin.so
	default
}

src_install() {
	domenu usr/share/applications/*.desktop
	doicon usr/share/pixmaps/*.png
	dodoc usr/share/doc/zoom/changelog

	insinto /usr/share/mime/packages/
	doins usr/share/mime/packages/zoom.xml

	insinto /opt/zoom
	doins -r opt/zoom/*
	fperms +x /opt/zoom/ZoomLauncher
	fperms +x /opt/zoom/zoom{,linux,.sh}

	dosym ../../opt/zoom/ZoomLauncher usr/bin/zoom
}

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop unpacker xdg

DESCRIPTION="A feature-rich client for Matrix.org"
HOMEPAGE="https://about.riot.im"
SRC_URI="https://packages.riot.im/debian/pool/main/r/${PN}/${PN}_${PV}_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-accessibility/at-spi2-core
	app-crypt/libsecret
	dev-libs/nss
	sys-apps/util-linux
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-misc/xdg-utils
"
DEPEND="${RDEPEND}"

QA_PREBUILT="
	opt/Riot/crashpad_handler
	opt/Riot/libEGL.so
	opt/Riot/libffmpeg.so
	opt/Riot/libGLESv2.so
	opt/Riot/libvk_swiftshader.so
	opt/Riot/riot-desktop
	opt/Riot/swiftshader/libEGL.so
	opt/Riot/swiftshader/libGLESv2.so
"

S="${WORKDIR}"

src_install() {
	domenu usr/share/applications/*.desktop
	gzip -d usr/share/doc/riot-desktop/changelog.gz
	dodoc usr/share/doc/riot-desktop/changelog

	for size in 16 24 48 64 96 128 256 512
	do
		doicon -s ${size} usr/share/icons/hicolor/${size}x${size}/apps/*.png
	done

	# make repoman leave me alone D:
	mkdir usr/bin
	cd usr/bin
	ln -s ../../opt/Riot/riot-desktop ./
	cd ../../

	insinto /opt
	doins -r opt/*
	insinto /usr/bin
	doins usr/bin/riot-desktop

	fperms +x /opt/Riot/riot-desktop
}

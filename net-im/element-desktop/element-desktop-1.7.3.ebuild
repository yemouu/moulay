# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop unpacker xdg

DESCRIPTION=" A glossy Matrix collaboration client for desktop"
HOMEPAGE="https://element.io/"
SRC_URI="https://packages.riot.im/debian/pool/main/e/${PN}/${PN}_${PV}_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-accessibility/at-spi2-core
	app-crypt/libsecret
	dev-db/sqlcipher
	dev-libs/libappindicator
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
	opt/Element/element-desktop
	opt/Element/libEGL.so
	opt/Element/libffmpeg.so
	opt/Element/libGLESv2.so
	opt/Element/libvk_swiftshader.so
	opt/Element/swiftshader/libEGL.so
	opt/Element/swiftshader/libGLESv2.so
"

S="${WORKDIR}"

src_install() {
	domenu usr/share/applications/*.desktop
	gzip -d usr/share/doc/${PN}/changelog.gz
	dodoc usr/share/doc/${PN}/changelog

	for size in 16 24 48 64 96 128 256 512
	do
		doicon -s ${size} usr/share/icons/hicolor/${size}x${size}/apps/*.png
	done

	mkdir usr/bin
	cd usr/bin
	ln -s ../../opt/Element/${PN} ./
	cd ../../

	insinto /opt
	doins -r opt/*
	insinto /usr/bin
	doins usr/bin/${PN}

	fperms +x /opt/Element/${PN}
}

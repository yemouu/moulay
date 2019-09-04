# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop unpacker xdg-utils

DESCRIPTION="All-in-one voice and text chat for gamers."
HOMEPAGE="https://discordapp.com"
SRC_URI="https://dl-canary.discordapp.net/apps/linux/${PV}/${P}.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/alsa-lib
	gnome-base/gconf
	x11-libs/libnotify
	dev-libs/nspr
	dev-libs/nss
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	sys-libs/libcxx"
	#dev-libs/libappindicator
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/"

PATCHES=( ${FILESDIR}/${PN}-desktop.patch )

QA_PREBUILT="
	opt/discord-canary/libffmpeg.so
	opt/discord-canary/chrome-sandbox
	opt/discord-canary/libEGL.so
	opt/discord-canary/libGLESv2.so
	opt/discord-canary/DiscordCanary
	opt/discord-canary/swiftshader/libEGL.so
	opt/discord-canary/swiftshader/libGLESv2.so
"

src_install() {
	DISCORD_PKG_HOME=usr/share/discord-canary
	DISCORD_HOME=/opt/discord-canary

	mv ${DISCORD_PKG_HOME}/discord{,-canary}.png
	doicon ${DISCORD_PKG_HOME}/*.png
	domenu ${DISCORD_PKG_HOME}/*.desktop

	insinto ${DISCORD_HOME}
	doins -r ${DISCORD_PKG_HOME}/*
	fperms +x ${DISCORD_HOME}/DiscordCanary
	dosym ../../${DISCORD_HOME}/DiscordCanary usr/bin/discordcanary
}

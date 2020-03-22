# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A library for managing configuration files, written for wayfire."
HOMEPAGE="https://wayfire.org/"
SRC_URI="https://github.com/WayfireWM/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-libs/libevdev
	dev-libs/libxml2
	media-libs/glm"
DEPEND="${RDEPEND}"
BDEPEND=""

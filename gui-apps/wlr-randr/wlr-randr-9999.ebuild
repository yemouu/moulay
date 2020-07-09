# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="An xrandr clone for wlroots compositors"
HOMEPAGE="https://github.com/emersion/wlr-randr"
EGIT_REPO_URI="https://github.com/emersion/wlr-randr"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/wayland"
DEPEND="${RDEPEND}"

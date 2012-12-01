# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="QuickTun is probably the simplest VPN tunnel software ever, yet
it's very secure. It relies on the NaCl encryption library by D. J. Bernstein."
HOMEPAGE="http://wiki.ucis.nl/QuickTun"
SRC_URI="http://oss.ucis.nl/quicktun/src/quicktun-2.1.7.tgz"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/nacl-toolchain-newlib"
RDEPEND="${DEPEND}"

src_compile() {
	NACL_SHARED=1 ./build.sh
}

src_install() {
	mkdir -p "${D}/usr/sbin/"
	cp out/quicktun.* "${D}/usr/sbin/"
}

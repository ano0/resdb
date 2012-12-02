# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Networking and Cryptography library"
HOMEPAGE="http://nacl.cr.yp.to/"
SRC_URI="http://hyperelliptic.org/nacl/nacl-20110221.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_compile(){
	./do
}

src_install(){
	SHORTHOSTNAME=`hostname | sed 's/\..*//' | tr -cd '[a-z][A-Z][0-9]'`
	PKGDIR="nacl-20110221"

	mv ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/*/* ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/
	mkdir ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/nacl

	mv ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/*.h ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/nacl/
	mv ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/lib/*/* ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/lib/

	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/log
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/work
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/data
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/x86
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/amd64
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/lpia
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/lib/x86
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/lib/amd64
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/lib/lpia
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/bin/ok*
	rm -rf ${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/lib/*.o

	rm "${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}/include/nacl/cpuid.h"

	mkdir -p ${D}/usr/
	cp -r "${WORKDIR}/${PKGDIR}/build/${SHORTHOSTNAME}"/* ${D}/usr/
}

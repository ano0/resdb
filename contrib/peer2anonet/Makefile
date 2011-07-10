#!/usr/bin/make -f

install-deb:
	mkdir DEBIAN/peer2anonet
	mkdir DEBIAN/peer2anonet/DEBIAN
	mkdir DEBIAN/peer2anonet/usr
	mkdir DEBIAN/peer2anonet/usr/bin
	mkdir DEBIAN/peer2anonet/etc
	mkdir DEBIAN/peer2anonet/etc/peer2anonet
	cp DEBIAN/control DEBIAN/peer2anonet/DEBIAN/control
	cp peer2anonet DEBIAN/peer2anonet/usr/bin/peer2anonet
	chmod +x DEBIAN/peer2anonet/usr/bin/peer2anonet
	cp LICENSE DEBIAN/peer2anonet/etc/peer2anonet/LICENSE
	dpkg-deb --build DEBIAN/peer2anonet
	dpkg -i DEBIAN/peer2anonet.deb
	rm -rf DEBIAN/peer2anonet DEBIAN/peer2anonet.deb

install:
	cp peer2anonet /usr/bin/peer2anonet
	chmod +x /usr/bin/peer2anonet
	mkdir /etc/peer2anonet
	cp LICENSE /etc/peer2anonet/LICENSE

uninstall:
	rm -r /usr/bin/peer2anonet /etc/peer2anonet

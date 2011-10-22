#!/usr/bin/make -f

install-deb:
	make clean
	./configure
	mkdir DEBIAN/splicex
	mkdir DEBIAN/splicex/DEBIAN
	mkdir DEBIAN/splicex/usr
	mkdir DEBIAN/splicex/usr/bin
	mkdir DEBIAN/splicex/etc
	mkdir DEBIAN/splicex/etc/splicex
	cp DEBIAN/control DEBIAN/splicex/DEBIAN/control
	cp LINUX/splicex.cp DEBIAN/splicex/usr/bin/splicex
	cp LINUX/splicex-deshadow.cp DEBIAN/splicex/usr/bin/splicex-deshadow
	rm -rf LINUX/*.cp
	chmod +x DEBIAN/splicex/usr/bin/splicex
	chmod +x DEBIAN/splicex/usr/bin/splicex-deshadow
	cp SPLICEX/splicex.list DEBIAN/splicex/etc/splicex/splicex.list
	cp LINUX/manual DEBIAN/splicex/etc/splicex/splicex.1
	gzip DEBIAN/splicex/etc/splicex/splicex.1
	cp SPLICEX/splicex.L DEBIAN/splicex/etc/splicex/splicex.L
	cp SPLICEX/splicex.N DEBIAN/splicex/etc/splicex/splicex.N
	cp SPLICEX/splicex.S DEBIAN/splicex/etc/splicex/splicex.S
	cp SPLICEX/splicex.LN DEBIAN/splicex/etc/splicex/splicex.LN
	cp SPLICEX/splicex.LS DEBIAN/splicex/etc/splicex/splicex.LS
	cp SPLICEX/splicex.NS DEBIAN/splicex/etc/splicex/splicex.NS
	cp SPLICEX/splicex.ALL DEBIAN/splicex/etc/splicex/splicex.ALL
	dpkg-deb --build DEBIAN/splicex
	dpkg -i DEBIAN/splicex.deb
	rm -rf DEBIAN/splicex DEBIAN/splicex.deb

install:
	make clean
	./configure
	make uninstall
	cp LINUX/splicex.cp /usr/bin/splicex
	cp LINUX/splicex-deshadow.cp /usr/bin/splicex-deshadow
	rm -rf LINUX/*.cp
	chmod +x /usr/bin/splicex
	chmod +x /usr/bin/splicex-deshadow
	mkdir /etc/splicex
	cp SPLICEX/splicex.list /etc/splicex/splicex.list
	cp LINUX/manual /etc/splicex/splicex.1
	gzip /etc/splicex/splicex.1
	cp SPLICEX/splicex.L /etc/splicex/splicex.L
	cp SPLICEX/splicex.N /etc/splicex/splicex.N
	cp SPLICEX/splicex.S /etc/splicex/splicex.S
	cp SPLICEX/splicex.LN /etc/splicex/splicex.LN
	cp SPLICEX/splicex.LS /etc/splicex/splicex.LS
	cp SPLICEX/splicex.NS /etc/splicex/splicex.NS
	cp SPLICEX/splicex.ALL /etc/splicex/splicex.ALL

uninstall:
	rm -rf /etc/splicex
	rm  -f /usr/bin/splicex
	rm  -f /usr/bin/splicex-deshadow

clean:
	rm DEBIAN/splicex DEBIAN/*.deb -rf

update:
	wget http://www.d3v11.ano/splicex.tgz
	tar -xvf ../splicex.tgz --directory='../'
	rm ../splicex.tgz

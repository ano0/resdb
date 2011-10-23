#!/usr/bin/make -f

install-deb:
	./.configure
	make preclean-deb
	mkdir DEBIAN/splicex
	mkdir DEBIAN/splicex/DEBIAN
	mkdir DEBIAN/splicex/usr
	mkdir DEBIAN/splicex/usr/bin
	mkdir DEBIAN/splicex/etc
	mkdir DEBIAN/splicex/etc/splicex
	cp DEBIAN/control DEBIAN/splicex/DEBIAN/control
	cp src/splicex.cp DEBIAN/splicex/usr/bin/splicex
	cp src/splicex-deshadow.cp DEBIAN/splicex/usr/bin/splicex-deshadow
	rm -rf src/*.cp
	chmod +x DEBIAN/splicex/usr/bin/splicex
	chmod +x DEBIAN/splicex/usr/bin/splicex-deshadow
	cp src/splicex.list DEBIAN/splicex/etc/splicex/splicex.list
	cp src/manual DEBIAN/splicex/etc/splicex/splicex.1
	gzip DEBIAN/splicex/etc/splicex/splicex.1
	cp src/splicex.L DEBIAN/splicex/etc/splicex/splicex.L
	cp src/splicex.N DEBIAN/splicex/etc/splicex/splicex.N
	cp src/splicex.S DEBIAN/splicex/etc/splicex/splicex.S
	cp src/splicex.LN DEBIAN/splicex/etc/splicex/splicex.LN
	cp src/splicex.LS DEBIAN/splicex/etc/splicex/splicex.LS
	cp src/splicex.NS DEBIAN/splicex/etc/splicex/splicex.NS
	cp src/splicex.ALL DEBIAN/splicex/etc/splicex/splicex.ALL
	dpkg-deb --build DEBIAN/splicex
	dpkg -i DEBIAN/splicex.deb
	rm -rf DEBIAN/splicex DEBIAN/splicex.deb

install:
	./.configure
	make preclean
	cp src/splicex.cp /usr/bin/splicex
	cp src/splicex-deshadow.cp /usr/bin/splicex-deshadow
	rm -rf src/*.cp
	chmod +x /usr/bin/splicex
	chmod +x /usr/bin/splicex-deshadow
	mkdir /etc/splicex
	cp src/splicex.list /etc/splicex/splicex.list
	cp src/manual /etc/splicex/splicex.1
	gzip /etc/splicex/splicex.1
	cp src/splicex.L /etc/splicex/splicex.L
	cp src/splicex.N /etc/splicex/splicex.N
	cp src/splicex.S /etc/splicex/splicex.S
	cp src/splicex.LN /etc/splicex/splicex.LN
	cp src/splicex.LS /etc/splicex/splicex.LS
	cp src/splicex.NS /etc/splicex/splicex.NS
	cp src/splicex.ALL /etc/splicex/splicex.ALL

uninstall:
	rm -rf /etc/splicex
	rm  -f /usr/bin/splicex
	rm  -f /usr/bin/splicex-deshadow

clean:
	rm DEBIAN/splicex DEBIAN/*.deb -rf

preclean:
	rm -rf /etc/splicex
	rm  -f /usr/bin/splicex
	rm  -f /usr/bin/splicex-deshadow

preclean-deb:
	rm DEBIAN/splicex DEBIAN/*.deb -rf

update:
	wget http://www.d3v11.ano/splicex.tgz
	tar -xvf ../splicex.tgz --directory='../'
	rm ../splicex.tgz

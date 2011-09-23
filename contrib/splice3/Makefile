#!/usr/bin/make -f

install-deb:
	make clean
	mkdir DEBIAN/splice3
	mkdir DEBIAN/splice3/DEBIAN
	mkdir DEBIAN/splice3/usr
	mkdir DEBIAN/splice3/usr/bin
	mkdir DEBIAN/splice3/etc
	mkdir DEBIAN/splice3/etc/splice3
	cp DEBIAN/control DEBIAN/splice3/DEBIAN/control
	./LINUX/splice3.compile
	mv LINUX/splice3.pyc DEBIAN/splice3/usr/bin/splice3
	mv LINUX/splice3-deshadow.pyc DEBIAN/splice3/usr/bin/splice3-deshadow
	chmod +x DEBIAN/splice3/usr/bin/splice3
	chmod +x DEBIAN/splice3/usr/bin/splice3-deshadow
	cp SPLICE3/splice3.list DEBIAN/splice3/etc/splice3/splice3.list
	cp LINUX/manual DEBIAN/splice3/etc/splice3/splice3.1
	gzip DEBIAN/splice3/etc/splice3/splice3.1
	#cp SPLICE3/LICENSE DEBIAN/splice3/etc/splice3/LICENSE
	cp SPLICE3/splice3.L DEBIAN/splice3/etc/splice3/splice3.L
	cp SPLICE3/splice3.N DEBIAN/splice3/etc/splice3/splice3.N
	cp SPLICE3/splice3.S DEBIAN/splice3/etc/splice3/splice3.S
	cp SPLICE3/splice3.LN DEBIAN/splice3/etc/splice3/splice3.LN
	cp SPLICE3/splice3.LS DEBIAN/splice3/etc/splice3/splice3.LS
	cp SPLICE3/splice3.NS DEBIAN/splice3/etc/splice3/splice3.NS
	cp SPLICE3/splice3.LNS DEBIAN/splice3/etc/splice3/splice3.LNS
	dpkg-deb --build DEBIAN/splice3
	dpkg -i DEBIAN/splice3.deb
	rm -rf DEBIAN/splice3 DEBIAN/splice3.deb

install:
	make clean
	make uninstall
	./LINUX/splice3.compile
	mv LINUX/splice3.pyc /usr/bin/splice3
	mv LINUX/splice3-deshadow.pyc /usr/bin/splice3-deshadow
	chmod +x /usr/bin/splice3
	chmod +x /usr/bin/splice3-deshadow
	mkdir /etc/splice3
	cp SPLICE3/splice3.list /etc/splice3/splice3.list
	cp LINUX/manual /etc/splice3/splice3.1
	gzip /etc/splice3/splice3.1
	cp SPLICE3/splice3.L /etc/splice3/splice3.L
	cp SPLICE3/splice3.N /etc/splice3/splice3.N
	cp SPLICE3/splice3.S /etc/splice3/splice3.S
	cp SPLICE3/splice3.LN /etc/splice3/splice3.LN
	cp SPLICE3/splice3.LS /etc/splice3/splice3.LS
	cp SPLICE3/splice3.NS /etc/splice3/splice3.NS
	cp SPLICE3/splice3.LNS /etc/splice3/splice3.LNS
	#cp SPLICE3/LICENSE /etc/splice3/LICENSE

uninstall:
	rm -rf /etc/splice3
	rm  -f /usr/bin/splice3
	rm  -f /usr/bin/splice3-deshadow

update-tor:
	usewithtor wget http://nbafkr7odek2wh6r.onion/splice3.tgz -O ../splice3.tgz
	tar -xvf ../splice3.tgz --directory='../'
	rm ../splice3.tgz
	cat CHANGES

update:
	wget http://www.d3v11.ano/splice3.tgz -O ../splice3.tgz
	tar -xvf ../splice3.tgz --directory='../'
	rm ../splice3.tgz
	cat CHANGES

clean:
	rm */*.pyc DEBIAN/splice3 DEBIAN/*.deb -rf


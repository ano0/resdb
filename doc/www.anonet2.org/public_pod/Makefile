all: index.html links.html

%.html: %.pod
	pod2html --noindex < $< 2>/dev/null > $@.tmp
	mv $@.tmp $@

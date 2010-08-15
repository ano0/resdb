all: index.html links.html faq.html darknet_comparison.html anonymity.html

%.html: %.pod
	pod2html --noindex < $< 2>/dev/null > $@.tmp
	mv $@.tmp $@

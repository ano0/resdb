all: index.html links.html faq.html darknet_comparison.html anonymity.html intro.html

%.html: %.pod
	pod2xhtml --noindex < $< 2>/dev/null > $@.tmp
	mv $@.tmp $@

all: index.html links.html faq.html darknet_comparison.html anonymity.html intro.html irc_anonymity.html services.html assholes.html thejetset_clientport.html icann.html about.html

%.html: %.pod
	pod2xhtml --noindex < $< 2>/dev/null > $@.tmp
	mv $@.tmp $@

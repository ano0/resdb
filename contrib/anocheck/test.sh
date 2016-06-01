#!/bin/sh
mkdir -p /var/cache/anocheck
/usr/local/libexec/bgp-paths.sh 4141 AN_out | tr ' ' '\n' | sort | uniq > /var/cache/anocheck/ASN.$(date +%s)
ls -rt /var/cache/anocheck/ASN.* | tail -r | tail -n+3 | xargs rm
ls -rt /var/cache/anocheck/ASN.* | tail -n2 | xargs diff
#this is nifty for hand-checks
#ls -rt /var/cache/anocheck/ASN.* | tail -n2 | xargs diff -s

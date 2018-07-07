#!/bin/sh
cd /var/db/resdb
commit=$(git log -1 | head -n1 | tr -cd 'a-f0-9')
query=$(head -n1 | tr -cd 'a-zA-Z0-9.:_-')
if ! cat "/var/cache/whois/${commit}-${query}" 2>/dev/null;then
 printf "%s\n" "${query}" | /var/db/resdb/contrib/whoisd/whoisd.pl | tee "/var/cache/whois/${commit}-${query}"
fi

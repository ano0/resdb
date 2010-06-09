#!/bin/sh

LOCALNODE=64520

(sleep 0.2;
 echo "insecure";
 echo "show ip bgp neigh";
 echo "quit";
) |
nc localhost 2605 |
grep "^BGP neighbor is" |
sed "s/^.*remote AS \([0-9]\+\),.*$/$LOCALNODE \1/"

(sleep 0.2;
 echo "insecure";
 echo "show ip bgp paths";
 echo "quit";
) |
nc localhost 2605 |
grep "[0-9].$" |
sed "s/^\[0x[a-z0-9]\{8\}:[0-9]\+\] ([0-9]\+) \([0-9 ]\+\)\r$/\1/"

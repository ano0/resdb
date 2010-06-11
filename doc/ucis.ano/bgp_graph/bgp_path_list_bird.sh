#!/bin/sh
LOCALNODE=${LOCALNODE:-0}
echo "show route all" | birdc | grep -F "BGP.as_path:" | sed "s/^\tBGP.as_path: \([0-9 ]*\)$/$LOCALNODE \1/" | sort -u

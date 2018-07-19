#!/bin/sh
# adds missing ip/*/*/cidr entries

cd db || exit 1
cd ip || exit 1
for a in *
do
	[ -e "$a" ] || continue
	ia=$((0x$a)) || exit 1
	cd "$a" || exit 1
	for b in *
	do
		[ -e "$b" ] || continue
		ib=$((0x$b)) || exit 1
		cd "$b" || exit 1
		for c in *
		do
			[ -e "$c" ] || continue
			ic=$((0x$c)) || exit 1
			cd "$c" || exit 1
			if [ ! -e cidr ]
			then
				printf "%d.%d.%d.0/24\n" "$ia" "$ib" "$ic"> cidr
				printf "ip/%s/%s/%s %d.%d.%d.0/24\n" "$a" "$b" "$c" "$ia" "$ib" "$ic" >&2
			fi
			cd ..
		done
		cd ..
	done
	cd ..
done

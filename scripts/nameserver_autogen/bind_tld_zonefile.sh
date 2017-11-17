#!/bin/bash
# made for bash. not sure if all /bin/sh work.
# be sure to set these variables first.
#RESDB_PATH=/var/db/resdb
#ZONEFILE_DIR=/etc/namedb
# optional:
: ${TLDS:=ano}
: ${RDNS_PREFIX:=21}

if [ ! "$ZONEFILE_DIR" ];then
 echo "You forgot to set some variables. read the source plzkthx." >&2
 exit 1
fi

# convert to hex
if [ "*" != "$RDNS_PREFIX" ];then
 X=""
 for PFX in $RDNS_PREFIX;do
  C=`printf "%02X\n" $PFX 2>/dev/null`
  [ -z "$X" ] && X="$C" || X="$X $C"
 done
 RDNS_PREFIX="$X"
fi


cd "$RESDB_PATH/db/ip" || exit 1
for PFX in $RDNS_PREFIX;do
 cd "$RESDB_PATH/db/ip/$PFX" 2>/dev/null || continue
 IP=$[0x$PFX]
 DOM=$IP.in-addr.arpa
 RDNS_ZONEFILE="$ZONEFILE_DIR/$DOM"
 echo -n "generating IPv4 reverse lookup zonefile for $IP/8..." >&2

 echo "; this zonefile genreated on: `date -u`" > "$RDNS_ZONEFILE".tmp
 echo '$TTL 3600' >> "$RDNS_ZONEFILE".tmp
 echo '$ORIGIN' $DOM >> "$RDNS_ZONEFILE".tmp
 echo '@ IN SOA @ root ('`date -u +" %Y%m%d%H"`' 60 300 3600000 3600 )' >> "$RDNS_ZONEFILE".tmp
 echo '@ IN NS @' >> "$RDNS_ZONEFILE".tmp
 echo '@ IN A 127.0.0.1' >> "$RDNS_ZONEFILE".tmp

 for i in */*/ns/*;do
  [ -e "$i" ] || continue
  f=$(basename $i)
  a=$(basename $(dirname $i))
  b=$(basename $(dirname $(dirname $i)))
  c=$(basename $(dirname $(dirname $(dirname $i))))
  printf "%d.%d IN NS %s\n" $[0x${b}] $[0x${c}] ${f}.
 done >> "$RDNS_ZONEFILE".tmp
 mv -f "$RDNS_ZONEFILE".tmp "$RDNS_ZONEFILE"
 echo " done." >&2
done


cd "$RESDB_PATH/db/dom"
for TLD in $TLDS;do
 cd "$RESDB_PATH/db/dom/$TLD" 2>/dev/null || continue
 ANO_ZONEFILE="$ZONEFILE_DIR/$TLD"
 echo -n "generating .${TLD} TLD zonefile..." >&2

 echo "; this zonefile genreated on: `date -u`" > "$ANO_ZONEFILE".tmp
 echo '$TTL 3600' >> "$ANO_ZONEFILE".tmp
 echo '$ORIGIN' $TLD >> "$ANO_ZONEFILE".tmp
 echo '@ IN SOA @ root ('`date -u +" %Y%m%d%H"`' 60 300 3600000 3600 )' >> "$ANO_ZONEFILE".tmp
 echo '@ IN NS @' >> "$ANO_ZONEFILE".tmp
 echo '@ IN A 127.0.0.1' >> "$ANO_ZONEFILE".tmp

 for name in *;do
  if [ -e "$name/ns/" ];then
   for server in "$name"/ns/*;do
    [ -e "$server" ] || continue
    fqserver=`cut -d/ -f3- <<< "$server"`
    echo -e "${name}\tIN NS\t${fqserver}."
    for ip in $(cat $server);do
     if grep ':' <<< "$ip" > /dev/null;then
      printf '%s.\tIN AAAA\t%s\n' "${fqserver}" "${ip}"
     else
      printf '%s.\tIN A\t%s\n' "${fqserver}" "${ip}"
     fi
    done
   done
  fi
 done >> "$ANO_ZONEFILE".tmp
 mv -f "$ANO_ZONEFILE".tmp "$ANO_ZONEFILE"
 echo " done." >&2
done

echo might want to send a sighup to your named now. >&2

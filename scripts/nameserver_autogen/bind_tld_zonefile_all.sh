#!/bin/bash
#made for bash. not sure if all /bin/sh work.
#be sure to edit these variables first.

#ZONEFILE_DIR=/etc/namedb
#RDNS_ZONEFILE=/etc/namedb/21.in-addr.arpa
#RESDB_PATH=/var/db/resdb

if [ ! "$ZONEFILE_DIR" ];then
 echo "You forgot to set some variables. read the source plzkthx."
 exit 0;
fi


echo -n "generating ipv4 reverse lookup zonefile for 21/8..."

echo "; this zonefile genreated on: `date -u`" > "$RDNS_ZONEFILE"
echo '$TTL 3600' >> "$RDNS_ZONEFILE"
echo '@ IN SOA @ root ('`date -u +" %Y%m%d%H"`' 60 300 3600000 3600 )' >> "$RDNS_ZONEFILE"
echo '@ IN NS @' >> "$RDNS_ZONEFILE"
echo '@ IN A 127.0.0.1' >> "$RDNS_ZONEFILE"

for i in `ls ${RESDB_PATH}/db/ip/15/*/*/ns/*`;do #this is for 21.
 f=$(basename $i)
 a=$(basename $(dirname $i))
 b=$(basename $(dirname $(dirname $i)))
 c=$(basename $(dirname $(dirname $(dirname $i))))
 printf "%d.%d IN NS %s\n" $[0x${b}] $[0x${c}] ${f}.
done >> "$RDNS_ZONEFILE"
echo done.

for GOHERE in ${RESDB_PATH}/db/dom/*;do

 cd ${GOHERE}
 TLD=$(basename ${GOHERE})
 ANO_ZONEFILE=${ZONEFILE_DIR}/${TLD}
 echo -n generating .${TLD} TLD zonefile... 
 echo "; this zonefile genreated on: `date -u`" > "$ANO_ZONEFILE"
 echo '$TTL 3600' >> "$ANO_ZONEFILE"
 echo '@ IN SOA @ root ('`date -u +" %Y%m%d%H"`' 60 300 3600000 3600 )' >> "$ANO_ZONEFILE"
 echo '@ IN NS @' >> "$ANO_ZONEFILE"
 echo '@ IN A 127.0.0.1' >> "$ANO_ZONEFILE"

 for name in *;do
  if [ -e "${name}/ns/" ];then
   for server in "$name"/ns/*;do
    if grep '\.ano$' <<< "$name" > /dev/null;then
     true
    fi
    if grep '\.ano$' <<< "$server" > /dev/null;then
     true
    fi
    fqserver=`cut -d/ -f3- <<< $server`
    echo -e "${name}\tIN NS\t${fqserver}."
    for ip in $(cat ${server});do 
     if grep ':' <<< "$ip" > /dev/null;then
      printf '%s.\tIN AAAA\t%s\n' "${fqserver}" "${ip}"
     else
      printf '%s.\tIN A\t%s\n' "${fqserver}" "${ip}"
     fi
    done
   done
  fi
 done >> "$ANO_ZONEFILE"
 echo done with ${TLD}
done

echo might want to send a sighup to your named now.

#!/bin/bash
#made for bash. not sure if all /bin/sh work.
#be sure to edit these variables first.

#ANO_ZONEFILE=/etc/namedb/ano
#RDNS_ZONEFILE=/etc/namedb/1.in-addr.arpa
#RESDB_PATH=/services/resdb/resdb

if [ ! "$ANO_ZONEFILE" ];then
 echo "You forgot to set some variables. read the source plzkthx."
 exit 0;
fi


echo -n "generating ipv4 reverse lookup zonefile for 21/8..."

echo "; this zonefile genreated on: `date -u`" > "$RDNS_ZONEFILE"
echo '$TTL 3600' >> "$RDNS_ZONEFILE"
echo '@ IN SOA @ root ('`date -u +" %Y%m%d%H"`' 60 300 3600000 3600 )' >> "$RDNS_ZONEFILE"
echo '@ IN NS @' >> "$RDNS_ZONEFILE"
echo '@ IN A 127.0.0.1' >> "$RDNS_ZONEFILE"

for i in `ls ${RESDB_PATH}/db/ip/15/*/*/ns/*`;do
 f=$(basename $i)
 a=$(basename $(dirname $i))
 b=$(basename $(dirname $(dirname $i)))
 c=$(basename $(dirname $(dirname $(dirname $i))))
 printf "%d.%d IN NS %s\n" $[0x${b}] $[0x${c}] ${f}.
done >> "$RDNS_ZONEFILE"
echo done.

cd ${RESDB_PATH}/db/dom/ano

echo -n generating .ano TLD zonefile... 

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
   for ip in `cat ${server}`;do 
    if grep ':' <<< "$ip" > /dev/null;then
     echo -e "${fqserver}.\tIN AAAA\t$ip"
    else
     echo -e "${fqserver}.\tIN A\t$ip"
    fi
   done
  done
 fi
done >> "$ANO_ZONEFILE"
echo done.
echo might want to send a sighup to your named now.

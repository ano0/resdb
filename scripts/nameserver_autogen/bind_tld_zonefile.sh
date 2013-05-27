#!/bin/bash
#made for bash. not sure if all /bin/sh work.
#be sure to edit these variables first.

ANO_ZONEFILE=/etc/namedb/ano
RESDB_PATH=/services/resdb/resdb

echo "; this zonefile genreated on: `date`" > $ANO_ZONEFILE
echo '$TTL 3600' >> $ANO_ZONEFILE
echo '@ IN SOA localns root ('`date +" %Y%m%d00"`' 60 300 3600000 3600 )' >> $ANO_ZONEFILE
echo '@ IN NS localns' >> $ANO_ZONEFILE
echo 'localns IN A 127.0.0.1' >> $ANO_ZONEFILE

cd ${RESDB_PATH}/db/dom/ano

echo -n generating zonefile... 
for name in *;do
 if [ -e "${name}/ns/" ];then
  for server in "$name"/ns/*;do
   if grep '\.ano$' <<< $name > /dev/null;then
    true
   fi
   if grep '\.ano$' <<< $server > /dev/null;then
    true
   fi
   fqserver=`cut -d/ -f3- <<< $server`
   echo -e "${name}\tIN NS\t${fqserver}."
   for ip in `cat ${server}`;do 
    echo -e "${fqserver}.\tIN A\t$ip"
   done
  done
 fi
done >> $ANO_ZONEFILE
echo done.
echo might want to send a sighup to your named now.

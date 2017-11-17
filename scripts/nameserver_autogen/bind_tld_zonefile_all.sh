#!/bin/sh
# be sure to set these variables first.
#ANO_ZONEFILE=/etc/namedb/ano
#RDNS_ZONEFILE=/etc/namedb/21.in-addr.arpa
#RESDB_PATH=/services/resdb/resdb
if [ ! "$ANO_ZONEFILE" ];then
 echo "You forgot to set some variables. read the source plzkthx." >&2
 exit 1
fi
# compat
export ZONEFILE_DIR=`dirname $RDNS_ZONEFILE`
TLDS='!' `dirname $0`/bind_tld_zonefile.sh
export ZONEFILE_DIR=`dirname $ANO_ZONEFILE`
RDNS_PREFIX='!' TLDS='*' `dirname $0`/bind_tld_zonefile.sh

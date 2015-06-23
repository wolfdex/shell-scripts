#!/bin/bash
# W.-Marcel Richter (wmrichter@gmail.com)

ts=$(date +%s)
dbxpath="$HOME/cloud/Dropbox"

#uid=$(id -u)
#dbcpath="/run/user/$uid/"

dbcpath="$HOME/crypt"

if [ -z $1 ];  then
  encname1="$dbxpath/.crypt${ts}"
  encname2="$dbcpath/crypt${ts}"
else
  encname1="$dbxpath/.$1"
  encname2="$dbcpath/$1"
fi

if [ -z $2 ];  then
  keysafe="${ts}.key.gpg"
else
  keysafe=$2
fi

if [ !  -f $keysafe ]; then
  echo "create keyfile"
  tr -dc [:print:] </dev/urandom | head -c 4096 | gpg --symmetric --armor > ${keysafe}
  readlink -f $keysafe
fi

encfs-create.sh $encname1 $encname2 $keysafe
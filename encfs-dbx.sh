#!/bin/bash
# W.-Marcel Richter (wmrichter@gmail.com)

ts=$(date +%s)
dbxpath="$HOME/cloud/Dropbox"
dbcpath="$HOME/crypt"

# help
fkthelp () {
  echo "encfs-dbx.sh - by W.-M. Richter"
  echo ""
  echo "encfs-dbx.sh -h		this help"
  echo "encfs-dbx.sh CRYPTED_FOLDER"
  echo "encfs-dbx.sh CRYPTED_FOLDER KEYFILE"
  echo "encfs-dbx.sh CRYPTED_FOLDER KEYFILE -ck"
  echo ""  
  echo "encfs-dbx.sh -ck KEYFILE	create keyfile"	
  exit 1
} 


# show help
if [ "$1" = "-h" ]; then
  fkthelp
  exit 1
fi

# test -ck > create keyfile
if [ "$1" = "-ck" ]; then   
  encfs-create.sh $1 $2  
  exit 1
fi

# run without arguments
if [ -z $1 ]; then
  encname1="$dbxpath/.crypt${ts}"
  encname2="$dbcpath/crypt${ts}"
else
  encname1="$dbxpath/.$1"
  encname2="$dbcpath/$1"
fi

encfs-mnt.sh  $encname1 $encname2 $2 $3
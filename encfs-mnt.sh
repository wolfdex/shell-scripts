#!/bin/bash
# W.-Marcel Richter (wmrichter@gmail.com)

ts=$(date +%s)

## keyfile
ksize=4096
# [:print:] [:graph:] -> tr --help
ksigns="[:print:]"

## encfs
#inactivity timeout
#to="-i 8"


# help
fkthelp () {
  echo "encfs-create.sh - by W.-M. Richter"
  echo ""
  echo "encfs-create.sh -h		this help"
  echo "encfs-create.sh CRYPTED_FOLDER"
  echo "encfs-create.sh CRYPTED_FOLDER -kf KEYFILE"
  #echo "encfs-create.sh CRYPTED_FOLDER -kf KEYFILE -ck"
  echo "encfs-create.sh CRYPTED_FOLDER TARGET_FOLDER"
  echo "encfs-create.sh CRYPTED_FOLDER TARGET_FOLDER KEYFILE"
  echo "encfs-create.sh CRYPTED_FOLDER TARGET_FOLDER KEYFILE -ck"
  echo ""  
  echo "encfs-create.sh -ck KEYFILE	create keyfile"	
  exit 1
} 

# function to create keyfile
fktcreate_keyfile () {
 if [ -f $1 ]; then
   echo "file exists"
 else
   tr -dc $ksigns </dev/urandom | head -c $ksize | gpg --symmetric --armor > $1
   readlink -f $1
 fi
} 


# show help
if [ "$1" = "-h" ]; then
  fkthelp
  exit 1
fi

# test -ck > create keyfile
if [ "$1" = "-ck" ]; then
  if [ ! -z $2 ];  then
    keyfile=$2 
  else
    keyfile="$ts.key.gpg"
  fi
    fktcreate_keyfile $keyfile
  exit 1
fi

if [ -z $1 ];  then
  encname1="$(pwd)/.crypt${ts}"
  encname2="$(pwd)/crypt${ts}"
fi

if [ $# -eq 1 ];  then
  encname1="$(pwd)/.$1"
  encname2="$(pwd)/$1"
fi

if [ $# -eq 2 ];  then
  encname1=$1
  encname2=$2
fi

if [ $# -gt 2 ];  then
  if [ "$2" = "-kf" ]; then
    encname1="$(pwd)/.$1"
    encname2="$(pwd)/$1"   
  else
    encname1=$1
    encname2=$2
  fi
  
  keyfile=$3
    
fi

if [ ! -z $keyfile ]; then
  if [ ! -f $keyfile ] && [ "$4" != "-ck" ] ; then
    echo "missing keyfile"
    echo "$keyfile"
    exit 0  
  elif [ "$4" = '-ck' ]; then 
    fktcreate_keyfile $keyfile
  fi  
  
  encfs $encname1 $encname2 $to --extpass="gpg --no-mdc-warning -o - $keyfile"
  
else
  
  encfs $encname1 $encname2 $to 
  
fi






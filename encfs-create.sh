#!/bin/bash
# W.-Marcel Richter (wmrichter@gmail.com)

ts=$(date +%s)

#inactivity timeout
#to="-i 8"

if [ -z $1 ];  then
  encname1="$HOME/.crypt${ts}"
  encname2="$HOME/crypt${ts}"
else
  encname1=$1
  encname2=$2 
fi

if [ -z $3 ];  then
  keysafe="${ts}.key.gpg"
else
  keysafe=$3
fi

if [ !  -f $keysafe ]; then
  echo "create keyfile"
  tr -dc [:print:] </dev/urandom | head -c 4096 | gpg --symmetric --armor > ${keysafe}
  readlink -f $keysafe
fi

if [ -f $keysafe ]; then
  echo "run encfs for $encname1"
  encfs $encname1 $encname2 $to --extpass="gpg --no-mdc-warning -o - $keysafe"
fi
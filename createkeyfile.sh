#!/bin/bash
# W.-Marcel Richter (wmrichter@gmail.com)

#size of keyfile
size=4096

# [:print:] [:graph:] -> tr --help
signs="[:print:]"

# get timestamp as filename if not given
if [ -n $1 ];  then
  fn=$(date +%s)
  fn="$fn.key.gpg"
else
  fn=$1  
fi

# create keyfile and save in gpg
tr -dc $signs </dev/urandom | head -c $size | gpg --symmetric --armor > $fn

readlink -f $fn


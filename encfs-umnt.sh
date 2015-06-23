#!/bin/bash
# W.-Marcel Richter (wmrichter@gmail.com)

echo $1

if [ -n $1 ];  then
  fusermount -u $1
  rm  -r $1
else
  echo "fehler"
  
fi


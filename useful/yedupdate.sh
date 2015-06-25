#!/bin/bash
pt=~/bin/apps/yed
pr=~/bin/apps/yed

file=`ls -rt $pr/*.zip | awk 'NR>1 { print $1 }'`
echo $file
if [ -z $file ]
then
 echo "get newest Version as zip from http://www.yworks.com/en/downloads.html#yEd"
 exit 1
fi

DIRECTORY=`echo "$file" | tr A-Z a-z`
DIRECTORY=`basename $DIRECTORY .zip`

if [ -d "$pt/$DIRECTORY" ]
then
  echo "$DIRECTORY exists"
   exit 1
else
  echo "$DIRECTORY"
    7z x $file -o$pt  
fi

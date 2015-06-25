#!/bin/bash
# W.-Marcel Richter (wmrichter@gmail.com)
# older version,
# use encfs-mnt.sh -u

ft=$(mount | grep  " $1 " |  awk '{print $1}')


if [ ! "$ft" = "encfs" ] ; then 
 echo "encfs not found"
 exit 0
fi

tres=$(fusermount -u $1 && rm  -r $1)



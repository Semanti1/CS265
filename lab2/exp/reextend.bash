#!/bin/bash 

if [ $# != 2 ] ; then 
echo "USAGE: $0 from to" 
exit 1 
fi 

from=$1 
to=$2 

for i in *; do 
base=`basename $i ${from}` 
if [ $i != ${base} ]; then 
mv $i ${base}${to} 
fi 
done 


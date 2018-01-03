#!/bin/bash
for i in *;
do  echo -n  $i;echo -n " "; wc -l< $i| xargs echo -n;echo -n " "; wc -w<$i;done





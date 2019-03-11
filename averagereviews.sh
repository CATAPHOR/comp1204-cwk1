#!/bin/bash

for file in $1/*
do
	grep '^<Overall>' $file | sed 's|<Overall>||' | awk -v file="$file" '{t+=$1; num+=1}END{gsub(/.*\//,"",file); gsub(/.dat/,"",file); printf("%s %0.2f\n", file, t/num);}'
done | sort -nrk2

#!/bin/bash

for file in $1/*
do
	name=$(echo $file | sed 's|^.*/||; s|.dat||')
	num=$(grep -c '^<Author>' $file)
	echo "$name $num"
done | sort -nrk2

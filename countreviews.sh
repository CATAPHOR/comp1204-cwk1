#!/bin/bash

for file in $1/*
do
	name=$(echo $file | sed 's|^.*/||; s|.dat||')
	num=$(grep '^<Author>' $file | wc -l)
	echo "$name $num"
done | sort -nrk2

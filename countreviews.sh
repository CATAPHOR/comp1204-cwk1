#!/bin/bash

for file in $1/*
do
	num=$(grep -o '<Author>' $file | wc -l)
	name=$(echo $file | sed 's|^.*/||; s|.dat||')
	echo "$name $num"
done | sort -nrk2


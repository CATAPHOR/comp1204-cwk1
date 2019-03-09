#!/bin/bash

for file in $1/*
do
	lines=$(grep '<Overall>' $file)
	num=$(echo "$lines" | wc -l)
	avg=$(echo "$lines" | sed 's|<Overall>||' | awk -v num="$num" '{t+=$1}END{printf "%0.2f", t/num;}')
	name=$(echo $file | sed 's|^.*/||; s|.dat||')
	echo "$name $avg"
done | sort -nrk2

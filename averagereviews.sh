#!/bin/bash

for file in $1/*
do
	scores=$(grep '^<Overall>' $file | sed 's|<Overall>||')
	num=$(echo "$scores" | wc -l)
	avg=$(echo "$scores" | awk -v num="$num" '{t+=$1}END{printf "%0.2f", t/num;}')

	name=$(echo $file | sed 's|^.*/||; s|.dat||')
	echo "$name $avg"
done | sort -nrk2

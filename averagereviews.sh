#!/bin/bash

for file in $1/*
do
	name=$(echo $file | sed 's|^.*/||; s|.dat||')

	scores=$(grep '^<Overall>[0-5]' $file | sed 's|<Overall>||')
	num=$(echo "$scores" | wc -l)
	avg=$(echo "$scores" | awk -v num="$num" '{t+=$1}END{printf "%0.2f", t/num;}')

	echo "$name $avg"
done | sort -nrk2

#!/bin/bash

num=$(grep -o '<Author>' $1 | wc -l)
echo "$num"


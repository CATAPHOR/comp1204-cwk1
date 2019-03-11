#!/bin/bash

grep -Rc "^<Author>" $1/* | awk -v FS=":" '{gsub(/.*\//,"",$1); gsub(/.dat/,"",$1); print($1 " " $2);}' | sort -nrk2

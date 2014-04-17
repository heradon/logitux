#!/bin/bash

# logitux config reader

CONFIG=../testfile.cfg

for i in `cat $CONFIG | grep -v "#" | cut -d"=" -f2 | sed 's/^ //' | grep -v "^$"`; do
    echo $i;
done

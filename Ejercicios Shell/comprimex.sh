#!/bin/bash

date > fecha.txt
tar -cf ficomp.tar fecha.txt
rm fecha.txt

for var in *
do
    if [ -x "$var" ] || [ -S "$var" ] || [ -L "$var" ]
    then
        tar -rf ficomp.tar "$var"
    fi
done

gzip ficomp.tar

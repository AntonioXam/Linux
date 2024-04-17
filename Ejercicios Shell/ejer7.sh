#!/bin/bash

for var in $*
do

if test `expr $var % 2` -ne 0
then
echo "Este numero es impar--> $var "
fi
done
#!/bin/bash

echo -n "Introduce un valor numérico: "
read num
expr $num + 1 >/dev/null 2> /dev/null
if [ $? -eq 0 ]; then

while [ $num -lt 1 -o $num -gt 10 ]; do

echo -n "Introduce un valor numérico: "
read num
done

fi
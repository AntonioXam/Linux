#!/bin/bash

OK=0
while [ $OK -ne 1 ]; do

echo -n "Introduce un valor numérico: "
read num
expr $num \* 1 >/dev/null 2> /dev/null
if [ $? -eq 0 ]; then

if [ $num -lt 1 -o $num -gt 10 ]; then

echo -n "Introduce un valor numérico: "
read num
OK=1
fi

fi
done
echo "Fin del programa"


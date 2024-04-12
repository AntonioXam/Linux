#!/bin/bash


if [ $# -eq 1 ]; then

echo "Tabla de multiplicar del $1:"
for i in {1..10}; do
echo "$1 x $i = $(($1 * $i))"
done
else
echo "Introduce exactamente un parámetro."
fi
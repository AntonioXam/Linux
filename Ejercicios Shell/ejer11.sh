#!/bin/bash

echo -n "Introduce un valor: "
read NUM1
echo -n "Introduce otro valor: "
read NUM2

while [ $NUM2 -le $NUM1 ]; do   
echo -n "ERROR: $NUM2 debe ser mayor que $NUM1"
echo -n "Introduce otro valor: "
read NUM2
done

echo "Los valores entre $NUM1 y $NUM2 son: "
while [ $NUM1 -le $NUM2 ]; do
echo -n "$NUM1 "
NUM1=$[$NUM1+1]
done

echo "FIN"
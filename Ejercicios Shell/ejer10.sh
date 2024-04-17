#!/bin/bash

echo -n "Introduce un número: "
read num
RESULT=$[$num%2] 

while [ $RESULT -ne 0 ]; do    
    echo -n "Introduce un número: "
    read num
    RESULT=$[$num%2] 
done

echo "Fin del programa"

#!/bin/bash

# comprobar parametro y numero entre 1 y 100 
if [ $# -ne 1 ];then
    echo "Debes introducir un parametro"
else
    if [ $1 -le 1 -o $1 -ge 100 ];then
        echo "Debes introducir un numero entre 1 y 100"
    else
        echo -n "dime un numero: "
        read num
        COUNT=$[$COUNT+1]
        while [ $num -ne $1 ];do
            if [ $num -lt $1 ];then
                echo -n "Introduce un numero mayor: "
                read num
                COUNT=$[$COUNT+1]
            fi
            if [ $num -gt $1 ];then
                echo -n "Introduce un numero menor: "
                read num
                COUNT=$[$COUNT+1]
            fi
        done
        echo "Usted ha introducido $COUNT numeros hasta acertar."
    fi
fi
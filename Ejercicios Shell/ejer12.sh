#!/bin/bash

if [ $# -eq 2 ]
then
clear

echo "******* OPERACIONES ******"
echo -e "\t [ 1 ] \t Sumar"
echo -e "\t [ 2 ] \t Restar"
echo -e "\t [ 3 ] \t Multiplicar"
echo -e "\t [ 4 ] \t Dividir"
echo -e " "
echo -n "Elige una opción: "
read OP

case $OP in
    1) RESULT=$[$1+$2]
    echo "El resultado de la suma $1 y $2 es $RESULT"
    ;;
    2) RESULT=$[$1-$2]
    echo "El resultado de la resta $1 y $2 es $RESULT"
    ;;
    3) RESULT=$[$1*$2]
    echo "El resultado de la multiplicación $1 y $2 es $RESULT"
    ;;
    4) RESULT=$[$1/$2]
    echo "El resultado de la división $1 y $2 es $RESULT"
    ;;
    *) echo "Elige una opción correcta"
    ;;
esac

else

echo "Numero de parametros incorrectos debes introducir 2 parametros"

fi

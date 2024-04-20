#!/usr/bin/env bash

if [ $# -ne 1 ] ; then
    echo "Numero de parametros incorrecto debes introducir 1 parametro"
else
    if [ -f $1 ] ; then
        num=`wc -l $1`
        conta=1
        while [ $num -gt 0 ] ; do
        echo -n "$conta "
        tail -n $num $1 | head -n 1
            num=`expr $num - 1`
            conta=`expr $conta + 1`
        done  
    
    else
        echo "$1 no es un archivo regular"
    fi
fi
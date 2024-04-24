#!/bin/bash

if [ $# -ne 1 ]
then
    echo -e "Error: el número de parámetros debe ser igual a 1.\nFin del programa."
else
    if ! [ -f $1 ]
    then
        echo -e "Error: el parámetro debe ser un fichero regular.\nFin del programa."
    else
        echo -n "¿Qué línea del fichero desea visualizar? "
        read LINEA

        while [ $LINEA -ne 0 ] 
        do 
            case $LINEA
            in
                1)
                    cat fichero.txt|head -n1
                    echo -e -n "¿Qué línea del fichero desea visualizar? "
                    read LINEA
                    ;;
                2)
                    cat fichero.txt|head -n2 |tail -n1
                    echo -e -n "¿Qué línea del fichero desea visualizar? "
                    read LINEA
                    ;;
                *)
                    echo "Opción no válida."
                    echo -e -n "¿Qué línea del fichero desea visualizar? "
                    read LINEA
                    ;;
            esac
        done       
    fi
fi
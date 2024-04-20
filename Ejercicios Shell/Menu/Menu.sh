#!/usr/bin/env bash

#Funcion para la opcion 1
listar(){
   for var in *; do
    if [ -f $var ]; then
        echo $var
    fi
   done
   
}

#Funcion para la opcion 2
visualizar(){
    echo -n "Introduce el nombre del fichero: "
    read fich
    if [ -f $fich ]; then
        cat $fich
    else
        echo "$fich no es un fichero regular"
    fi
}

#Funcion para la opcion 3
cambiar(){
    echo -n "Introduce el nombre actual del fichero: "
    read fich
    if [ -f $fich ]; then
        echo -n "Introduce el nuevo nombre del fichero: "
        read nuevo
        mv $fich $nuevo
    else
        echo "$fich no es un fichero regular"
    fi
}

#Funcion para la opcion 4
editor(){
    echo -n "Introduce el nombre del fichero: "
    read fich
    if [ -f "$fich" ]; then
        "${EDITOR:-vi}" "$fich"
    else
        echo "$fich no es un fichero regular"
    fi
}

#programa principal

until [[ $OPCION == 5 ]]; do
    case $OPCION in
        1)echo "Listado de ficheros del directorio actual" 
        listar ;;
        2)echo "Visualizar el contenido de un fichero" 
        visualizar ;;
        3)echo "Cambiar el nombre de un fichero" 
        cambiar ;;
        4)echo "Editar un fichero con el editor vi" 
        editor ;;
        *) echo "Opción no válida"
    esac
    echo
    echo "Menu de opciones"
    echo "    [1] Listado de ficheros del directorio actual"
    echo "    [2] Visualizar el contenido de un fichero"
    echo "    [3] Cambiar el nombre de un fichero"
    echo "    [4] Editar un fichero con el editor vi"
    echo "    [5] Salir"
    echo -n "Elige una opción: "
    read -r OPCION
done


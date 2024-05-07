#!/bin/bash

#hacer una agenda de contactos con menu

#funcion para visualizar los contactos
visualizar(){
    echo "Contactos de la agenda: "
    cat contactos.txt
    echo "Pulse ENTER para continuar..."
    read
}

#funcion para añadir un nuevo contacto con prueba de errores
#comprando que el nombre no este vacio y no puede contener numeros
#que el telefono no este vacio y sea un numero
#el email no este vacio y tenga un @ y un . en la parte final

nuevo(){
    echo "Introduce los datos del nuevo contacto"
    echo -n "Nombre: "
    read nombre
    while grep -q "^$nombre:" contactos.txt
    do
        echo "El contacto ya existe. Introduce otro nombre"
        read nombre
    done

    while [ -z "$nombre" ]
    do
        echo "Error: el nombre no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    done
     while [[ $nombre != [a-zA-Z]* ]]
    do
        echo "Error: el nombre solo puede contener letras"
        echo "Pulse ENTER para continuar..."
        read
        return
    done
    echo -n "Telefono: "
    read telefono
    while [ -z "$telefono" ]
    do
        echo "Error: el telefono no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    done
    while ! [[ "$telefono" =~ ^[0-9]+$ ]]
    do
        echo "Error: el telefono debe ser un numero"
        echo "Pulse ENTER para continuar..."
        read
        return
    done
    echo -n "Email: "
    read email
    while [ -z "$email" ]
    do
        echo "Error: el email no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    done
    while ! [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]
    do
        echo "Error: el email no es valido"
        echo "Pulse ENTER para continuar..."
        read
        return
    done
    echo "$nombre:$telefono:$email" >> contactos.txt
    echo "Contacto anadido"
    echo "Pulse ENTER para continuar..."
    read
}



#funcion para buscar un contacto

buscar(){
    echo -n "Introduce el nombre del contacto: "
    read nombre
    if [ -z "$nombre" ]
    then
        echo "Error: el nombre no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    fi
    grep -i "$nombre" contactos.txt
    echo "Pulse ENTER para continuar..."
    read
}

#funcion para borrar un contacto


borrar(){
    echo -n "Introduce el nombre del contacto a borrar: "
    read nombre
    if [ -z "$nombre" ]
    then
        echo "Error: el nombre no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    fi
    grep -v "$nombre" contactos.txt > contactos.tmp
    mv contactos.tmp contactos.txt
    echo "Contacto borrado"
    echo "Pulse ENTER para continuar..."
    read
}

#funcion para modificar un contacto

modificar(){
    echo -n "Introduce el nombre del contacto a modificar: "
    read nombre
    if [ -z "$nombre" ]
    then
        echo "Error: el nombre no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    fi
    grep -v "$nombre" contactos.txt > contactos.tmp
    mv contactos.tmp contactos.txt
    echo "Introduce los nuevos datos del contacto"
    echo -n "Nombre: "
    read nombre
    if [ -z "$nombre" ]
    then
        echo "Error: el nombre no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    fi
    echo -n "Telefono: "
    read telefono
    if [ -z "$telefono" ]
    then
        echo "Error: el telefono no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    fi
    if ! [[ "$telefono" =~ ^[0-9]+$ ]]
    then
        echo "Error: el telefono debe ser un numero"
        echo "Pulse ENTER para continuar..."
        read
        return
    fi
    echo -n "Email: "
    read email
    if [ -z "$email" ]
    then
        echo "Error: el email no puede estar vacio"
        echo "Pulse ENTER para continuar..."
        read
        return
    fi
    echo "$nombre:$telefono:$email" >> contactos.txt
    echo "Contacto modificado"
    echo "Pulse ENTER para continuar..."
    read
}

#funcion para salir del programa

salir(){
    echo "Saliendo del programa..."
    exit 0
}

#funcion para mostrar el menu

menu(){
    clear
    echo "Agenda de contactos"
    echo "1.- Visualizar contactos"
    echo "2.- Añadir contacto"
    echo "3.- Buscar contacto"
    echo "4.- Borrar contacto"
    echo "5.- Modificar contacto"
    echo "6.- Salir"
    echo -n "Introduce una opcion: "
    read opcion
    case $opcion in
        1) visualizar ;;
        2) nuevo ;;
        3) buscar ;;
        4) borrar ;;
        5) modificar ;;
        6) salir ;;
        *) echo "Opcion incorrecta"
    esac
    menu
}

#comprobamos si existe el fichero de contactos

if [ ! -f contactos.txt ]
then
    touch contactos.txt
fi

#llamamos a la funcion menu

menu

#fin del programa


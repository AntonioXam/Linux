#!/bin/bash

# 1.Visualizar todos los contactos
visualizar () {
    if [ ! -f agenda.txt ]
    then
	echo " No se ha introducido ningun contacto todavia en la agenda"
    else 
	if [ ! -s agenda.txt ]
    	then
	    echo " La agenda esta vacia. No tiene ningun contacto."	
    	else	
	    num=`wc -l < agenda.txt`
	    conta=0;
            while [ $num -gt 0 ]
	    do
	        nombre=`tail -n $num agenda.txt | head -n 1 | cut -d: -f1`
		    tlf=`tail -n $num agenda.txt | head -n 1 | cut -d: -f2`
		    dia=`tail -n $num agenda.txt | head -n 1 | cut -d: -f3`
		    mes=`tail -n $num agenda.txt | head -n 1 | cut -d: -f4`
		    anho=`tail -n $num agenda.txt | head -n 1 | cut -d: -f5`
		    num=`expr $num - 1`
	    	conta=`expr $conta + 1`
		echo -e  "\t$conta.  $nombre \t $tlf \t $dia-$mes-$anho"				
	    done		
        fi
    fi
}

# 2. Nuevo contacto
nuevo () {
    echo -n "Introduce nombre del nuevo contacto: "
    read nombre

    # Comprobamos que el nombre no exista en la agenda
    while  grep -q "^$nombre:" agenda.txt ; 
    do
        echo "El contacto ya existe. Introduce otro nombre"
        read nombre
    done

    # Comprobamos que el nombre no esté vacío
    while [[ $nombre = "" ]]
    do
        echo "ERROR: El nombre no puede estar vacío. Introduce nombre del nuevo contacto: "
        read nombre
    done

    # Comprobamos que el nombre solo contenga letras
    while [[ $nombre != [a-zA-Z]* ]] 
    do
        echo "ERROR: El nombre solo puede contener letras. Introduce nombre del nuevo contacto: "
        read nombre
    done

    echo -n "Introduce teléfono del nuevo contacto (9 dígitos): "
    read tlf

    # Comprobamos que el teléfono sea un número
    expr "$tlf" \* 1 >/dev/null 2> /dev/null
    while [ $? -ne 0 ]
    do
        echo -n "ERROR: El telfoy debe ser un número. Introduce telfoy del nuevo contacto: "
        read tlf
    done

    # Comprobamos que el teléfono tenga 9 dígitos
    while [[ $tlf = "" ]] ||  [[ ${#tlf} -ne 9 ]] || [[ $tlf != [0-9]* ]]
    do
        echo -n "ERROR: El teléfono debe ser un número de 9 digitos. Introduce teléfono del nuevo contacto: "
        read tlf
    done

    
    
    echo -n "Introduce día de nacimiento: "
    read dia

    # Comprobamos que el día sea un valor numérico
    expr "$dia" \* 1 >/dev/null 2> /dev/null
    while [ $? -ne 0 ]
    do
        echo -n "ERROR: El día debe ser un valor numérico. Introduce día de nacimiento: "
        read dia
    done

    # Comprobamos que el día sea un valor numérico entre 1 y 31
    while [[ $dia = "" ]] || [[ $dia -lt 1 ]] || [[ $dia -gt 31 ]]
    do
        echo -n "ERROR: El día debe ser un valor numérico entre 1 y 31. Introduce día de nacimiento: "
        read dia
    done
    
    echo -n "Introduce mes de nacimiento: "
    read mes

    # Comprobamos que el mes sea un valor numérico
    expr "$mes" \* 1 >/dev/null 2> /dev/null
    while [ $? -ne 0 ]
    do
        echo -n "ERROR: El mes debe ser un valor numérico. Introduce mes de nacimiento: "
        read mes
    done

    # Comprobamos que el mes sea un valor numérico entre 1 y 12
    while [[ $mes = "" ]] || [[ $mes -lt 1 ]] || [[ $mes -gt 12 ]]
    do
        echo -n "ERROR: El mes debe ser un valor numérico entre 1 y 12. Introduce mes de nacimiento: "
        read mes
    done
    
    echo -n "Introduce año de nacimiento: "
    read anho

    # Comprobamos que el año sea un valor numérico
    expr "$anho" \* 1 >/dev/null 2> /dev/null
    while [ $? -ne 0 ]
    do
        echo -n "ERROR: El año debe ser un valor numérico. Introduce año de nacimiento: "
        read anho
    done

    # Comprobamos que el año sea un valor numérico mayor que 1900
    while [[ $anho = "" ]] || [[ $anho -lt 1900 ]]
    do
        echo -n "ERROR: El año debe ser un valor numérico mayor que 1900. Introduce año de nacimiento: "
        read anho
    done
    
    echo "$nombre:$tlf:$dia:$mes:$anho" >> agenda.txt
}



# 3. Buscar contacto por nombre
# Busca el contacto en el fichero agenda.txt. Si lo encuentra, muestra su teléfono.
# Si no lo encuentra, muestra un mensaje de error.
# Se busca exactamente el nombre introducido, sin tener en cuenta mayúsculas o minúsculas.
# Se usa grep -q para no mostrar el resultado en la salida estándar.
# El grep devuelve 0 en caso de encontrar el contacto, 1 en caso contrario.
# Cut extrae los campos 2 a la última columna.
# -f2- indica desde el segundo campo hasta el último.

# Busca el contacto en el fichero agenda.txt
# Si lo encuentra, muestra su teléfono.
# Si no lo encuentra, muestra un mensaje de error.
buscar () {
    echo "Nombre del contacto a buscar:"
    read contacto
    grep -q "^$contacto:" agenda.txt
    if [ $? -eq 0 ]
    then
        grep "^$contacto:" agenda.txt | cut -d: -f2-
        
    else
        echo "El contacto no existe"
    fi
}



# 4. Eliminar contacto
# Busca el contacto en el fichero agenda.txt. Si lo encuentra, pregunta al usuario
# si está seguro de que desea eliminarlo. Si el usuario responde afirmativamente,
# elimina el contacto del fichero agenda.txt.
# grep -q "^$contacto:" agenda.txt busca el contacto exactamente como está escrito.
# El código devuelve 0 en caso de encontrar el contacto, 1 en caso contrario.
# read -r lee una línea desde la entrada estándar y lo guarda en la variable RESP
# [[ $RESP =~ [Ss] ]] comprueba si la variable RESP contiene una S o s en mayúscula o minúscula.
# Si el usuario responde afirmativamente, se elimina el contacto del fichero agenda.tmp,
# que contiene la salida de grep -v "^$contacto:" agenda.txt, es decir, todo el contenido
# del fichero agenda.txt excepto el contacto que se ha eliminado.
# Finalmente, se renombra el fichero agenda.tmp como agenda.txt.
eliminar () {
    echo "Nombre del contacto a eliminar:"
    read contacto
    grep -q "^$contacto:" agenda.txt
    if [ $? -eq 0 ]
    then
        echo -n "¿Está seguro de que desea eliminar $contacto? (s/n) "
        read -r RESP
        if [[ $RESP =~ [Ss] ]]
        then
            grep -v "^$contacto:" agenda.txt > agenda.tmp
            mv agenda.tmp agenda.txt
        fi
    else
        echo "El contacto no existe"
    fi
}


# 5. Avisar cumpleaños
# Busca en el fichero agenda.txt los contactos cuyo día y mes de cumpleaños coinciden con 
# la fecha actual. Si encuentra alguno, los muestra por pantalla.
# grep -q ":$diaHoy:$mesHoy:" agenda.txt busca el patrón exactamente como está escrito.
# El código devuelve 0 en caso de encontrar el patrón, 1 en caso contrario.
# tail -n $num agenda.txt muestra la última línea del fichero agenda.txt cuyo número de 
# línea es $num. head -n 1 muestra la primera línea de esa salida. cut -d: -f1,2,3,4 
# extrae los campos 1, 2, 3 y 4 (nombre, teléfono, día y mes de cumpleaños) del registro.
# Aumentamos $num en 1 en cada iteración para seguir buscando en el fichero agenda.txt.
# Si no hay cumpleaños hoy, muestra el mensaje correspondiente.
cumple () {
    # Calculamos la fecha de hoy
    diaHoy=`date +%d`
    mesHoy=`date +%m`

    # Buscamos en el fichero agenda.txt el patrón exactamente como está escrito:
    # :$diaHoy:$mesHoy:
    grep -q ":$diaHoy:$mesHoy:" agenda.txt
    if [ $? -eq 0 ]
    then
        # Si encuentra algún registro con esa fecha, recorremos el fichero y buscamos
        # los registros que coinciden con la fecha y los mostramos:
        num=`wc -l < agenda.txt`
        conta=0;
        while [ $num -gt 0 ]
        do
            nombre=`tail -n $num agenda.txt | head -n 1 | cut -d: -f1`
            tlf=`tail -n $num agenda.txt | head -n 1 | cut -d: -f2`
            dia=`tail -n $num agenda.txt | head -n 1 | cut -d: -f3`
            mes=`tail -n $num agenda.txt | head -n 1 | cut -d: -f4`
            num=`expr $num - 1`
            conta=`expr $conta + 1`
            if [[ $dia -eq $diaHoy ]] && [[ $mes -eq $mesHoy ]]
            then
                echo -e  "Cumpleaños de $nombre su tlf:$tlf"
            fi
        done    
    else
        echo "No hay cumpleaños hoy"
    fi

}














#Programa
fin=0
while [ $fin -ne 1 ]
do
   clear
   echo " *************************************************"	
   echo " *                      AGENDA:                  *"
   echo " *    [1] Visualizar todos los contactos         *"
   echo " *    [2] Nuevo contacto                         *"
   echo " *    [3] Buscar contacto                        *"
   echo " *    [4] Eliminar contacto                      *"
   echo " *    [5] Avisar cumpleanhos                     *"
   echo " *    [6] Salir                                  *"
   echo " *                                               *"
   echo " *************************************************"
   echo -n " Elige una opcion: "
   read respuesta
   case $respuesta in 
     1) echo " 1. Contactos de la agenda: "
	visualizar	
	;;

     2) echo " 2. Nuevo contacto"
	nuevo
	;;

     3) echo " 3. Buscar contacto"
        buscar
	;;

     4) echo " 4. Eliminar contacto" 
	eliminar
	;;
 
     5) echo " 5. Avisar cumpleanhos" 
	cumple 
	;;
  
     6) echo " 6. Salir"
	echo " Bye Bye"
	fin=1
	;;

     *) echo " La opcion introducida no es valida"
   esac

   echo " Pulse ENTER para continuar ..."
   read enter
done
	

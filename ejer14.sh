#!/bin/bash

doble(){
echo -n "Introduce un valor numérico: "
read num
expr $num \* 1 >/dev/null 2> /dev/null
if [ $? -eq 0 ]; then
    sleep 2
    echo "El doble de $num es $[$num*2]"
else
    echo "Fallo. Solo puedo hacer el doble de un numero"

fi

}

OK=0
while [ $OK -ne 1 ]; do
doble
echo "¿Desea calcular otro doble? S/N"
read RESP
if [ $RESP = "S" -o $RESP = "s" ]; then
    echo "Sea paciente, mientras calculamos su doble..."
    
else
    OK=1
fi
done
echo "FIN"

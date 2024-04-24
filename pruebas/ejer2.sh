#!/bin/bash

num=20

if [ $# -eq 1 ];then
	if [ -f $1 ];then
		while [ $num -ne 0 ];do
			echo -n "introduce una linea a mostrar: "
			read linea
				if [ $linea -eq 0 ];then
					num=0
				else	
					if [ $linea -gt 6 -o $linea -lt 0 ];then
						echo "no existe la linea solicitada, pide otra"
					fi
					if [ $linea -eq 1 ];then
						cat dos.txt|head -n1
					fi
					if [ $linea -eq 2 ];then
						cat dos.txt|head -n2|tail -n1
					fi
					if [ $linea -eq 3 ];then
						cat dos.txt|head -n3|tail -n1
					fi
					if [ $linea -eq 4 ];then
						cat dos.txt|head -n4|tail -n1
					fi
					if [ $linea -eq 5 ];then
						cat dos.txt|head -n5|tail -n1
					fi
					if [ $linea -eq 6 ];then
						cat dos.txt|head -n6|tail -n1
					fi
				fi	
		done
	else
		echo "No se trata de un fichero"
	fi
		
else
	echo "debes introducir un parametro"
fi

echo "Fin del programa"

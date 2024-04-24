#!/bin/bash


COUNT=0
hora=`date|cut -d " " -f5|cut -d ":" -f1`
minuto=`date|cut -d " " -f5|cut -d ":" -f2`
segundo=`date|cut -d " " -f5|cut -d ":" -f3`

if [ $1 != "hora" -a $1 != "minuto" -a $1 != "segundo" ];then
	echo "Debes introducir hora, minuto o segundo"
else
	if [ $1 = "hora" ];then
		echo "La hora actual del sistema es $hora"
		NUM=$hora
		echo "La tabla de multiplicar de $NUM es:"
		while [ $COUNT -le 10 ];do
			resultado=$[$COUNT*$NUM]
			echo "$NUM x $COUNT = $resultado"
			COUNT=$[$COUNT+1]
		done
	fi

	if [ $1 = "minuto" ];then
		echo "El minuto actual del sistema es $minuto"
		NUM=$minuto
		echo "La tabla de multiplicar de $NUM es:"
		while [ $COUNT -le 10 ];do
			resultado=$[$COUNT*$NUM]
			echo "$NUM x $COUNT = $resultado"
			COUNT=$[$COUNT+1]
		done
	fi

	if [ $1 = "segundo" ];then
		echo "El segundo actual del sistema es $segundo"
		NUM=$segundo
		echo "La tabla de multiplicar de $NUM es:"
		while [ $COUNT -le 10 ];do
			resultado=$[$COUNT*$NUM]
			echo "$NUM x $COUNT = $resultado"
			COUNT=$[$COUNT+1]
		done
	fi

fi




		





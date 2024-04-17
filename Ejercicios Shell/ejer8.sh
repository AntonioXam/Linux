#!/bin/bash

for var in * 
do
if test -f "${var}" ; then
echo "${var} es un archivo regular"
fi
if test -w "${var}" ; then
echo "${var} es un archivo con permisos de escritura"
fi
if test -d "${var}" ; then
echo "${var} es un directorio"
fi

done
#!/bin/bash

# Este script suma dos números pasados como argumentos

# Verifica si se pasaron exactamente dos argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 numero1 numero2"
    exit 1
fi

# Suma los argumentos
suma=$(($1 + $2))

# Muestra el resultado
echo "La suma de $1 y $2 es: $suma"

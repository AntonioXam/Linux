#!/bin/bash

echo -n "El primero indetificador --> "
more /etc/passwd | head -n 1 | cut -d":" -f3,1
echo -n "El último indetificador  --> "
more /etc/passwd | tail -n 1 | cut -d":" -f3,1


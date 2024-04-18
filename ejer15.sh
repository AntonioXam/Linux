#!/bin/bash

login=`whoami`
dia=`date +%d`
mes=`date +%m`
anio=`date +%Y`

nombrefich=$login-$dia-$mes-$anio

ls -l > $nombrefich

#!/bin/bash
# Mostrar los puntos de montaje de los dispositivos de almacenamiento,
# así como su sistema de archivos

clear
echo
echo "S.ficheros  Tipo   Montado en"
echo "============================="
df -h -T | grep "/dev/" | awk '{print $1,"  "$2,"  "$7}'
echo

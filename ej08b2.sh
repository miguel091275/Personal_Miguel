#!/bin/bash
# Determinar que proces está consumiendo mas CPU
clear
echo
echo "El proceso que está consumiendo mas MEMORIA, es: "
echo
echo "%MEM COMANDO"
echo "============"
ps aux | awk '{print $4, $11}' | sort -k1rn | head -n 1
#ps -e -o pcpu,state,args --sort pcpu | tail -n 1
echo

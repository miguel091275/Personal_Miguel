#!/bin/bash
# Hacer un enlace simólico de todos los programas del directorio actual
# (archivos ejecutables) hacia el subdirectorio bin del directorio propio
# del usuario, muestre los nombres de los archivos ejecutables e indique
# cuántos ha enlazado o que no ha enlazado ninguno. Si el directorio bin
# no existe, deberá ser creado.

clear
CARPETA="$HOME/bin"
if [ -d $CARPETA ]; then
	echo
	echo "El directorio $CARPETA existe."
	echo
	# Contar la cantidad de archivos ejecutables
	TOTEXEC=$(find $HOME/bin/ -type f -executable | wc -l)

	# Contar la cantidad de archivos enlazados
	TOTENLAZ=$(ls -l $HOME/bin/ | grep "^l" | wc -l)

	# Contar la cantidad de archivos no enlazados
	let TOTNOENLAZ=$TOTEXEC-$TOTENLAZ

	# Muestro los archivos ejecutables
	find $HOME/bin/ -type f -executable

	# Muestro las estadísticas
	echo
	echo "Total archivos ejecutables: $TOTEXEC"
	echo
	echo "Total archivos enlazados: $TOTENLAZ"
	echo
	echo "Total archivos no enlazados: $TOTNOENLAZ"
	echo
else
	echo
	echo "El directorio $CARPETA no existe,"
	echo "por lo tanto se creará automáticamente."
	echo
	# Se realiza el enlaze simbólico
	ln -s /bin $HOME/bin

	# Contar la cantidad de archivos ejecutables
	TOTEXEC=$(find $HOME/bin/ -type f -executable | wc -l)

	# Contar la cantidad de archivos enlazados
	TOTENLAZ=$(ls -l $HOME/bin/ | grep "^l" | wc -l)

	# Contar la cantidad de archivos no enlazados
	let TOTNOENLAZ=$TOTEXEC-$TOTENLAZ

	# Muestro los archivos ejecutables
	find $HOME/bin/ -type f -executable

	# Muestro las estadísticas
	echo
	echo "Total archivos ejecutables: $TOTEXEC"
	echo
	echo "Total archivos enlazados: $TOTENLAZ"
	echo
	echo "Total archivos no enlazados: $TOTNOENLAZ"
	echo
fi

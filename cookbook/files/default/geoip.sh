#!/bin/bash

#Declaramos un array para guardar los hostnames
declare -a LISTANOMBRES

function resolveArpa {
	reverseHostname=$(nslookup -query=ptr $1 | grep "name =" | awk -F ' = ' '{print $2}')
        if [ "$reverseHostname " != " " ]; then
		echo $reverseHostname
	fi
}

#Comprobamos si se ha pasado algún hostname
if [ $# -eq 0 ]; then
        echo "Nada que hacer.."
        exit 1
fi

#Geoiplookup no soporta nombres tipo arpa. Hay que traducirlas antes
for arg in "$@"; do
	if [[ "$arg" == *"arpa" ]]; then
        	arg=$(resolveArpa $arg)
	fi
        LISTANOMBRES+=($arg)
done

#Ejecutamos en parallelo geoiplookup con la lista de nombres
if [ "${#LISTANOMBRES[@]}" -ne 0 ]; then
	parallel --tag geoiplookup ::: "${LISTANOMBRES[@]}"
else
	exit 1
fi


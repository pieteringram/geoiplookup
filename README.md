# geoiplookup

Para lanzar geolookup en paralelo se puede utilizar chef-solo de la siguiente manera:

chef-solo -c ruta_fichero_conf -j node.json

El fichero de configuración ha de apuntar a la carpeta donde se haya instalado el cookbook "cookbook"
El fichero node.json contiene la lista de hostnames de las que se quiere obtener la geolocalización.

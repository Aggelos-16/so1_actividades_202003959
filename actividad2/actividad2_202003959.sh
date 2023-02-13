#!/bin/bash
read -p 'Ingresa el usuario de github: ' GITHUB_USER
CONTENIDO=$(curl -s https://api.github.com/users/${GITHUB_USER})
GITID=$(jq -r '.id' <<< "${CONTENIDO}")
GITCA=$(jq -r '.created_at' <<< "${CONTENIDO}")
echo Hola $GITHUB_USER. User ID: $GITID. Cuenta fue creada el: $GITCA.

FECHA=`date +"%d-%m-%Y"`
mkdir -p tmp/${FECHA}/
touch tmp/${FECHA}/saludos.log
echo Hola $GITHUB_USER. User ID: $GITID. Cuenta fue creada el: $GITCA. >> tmp/${FECHA}/saludos.log
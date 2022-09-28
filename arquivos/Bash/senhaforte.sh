#!/bin/bash
#senhaforte.sh
#Publicado por Carlos Affonso Henriques. no site da Viva o linux
#fonte: https://www.vivaolinux.com.br/script/Gerador-de-senhas-fortes

EASYPASS="${1}"
rnd0="19"

for i in $(seq 0 "${rnd0}")
do
		EASYPASS=$(sha224sum  <(echo -n "${EASYPASS}") | cut -f 1 -d" ")
		# echo "${EASYPASS}"
done

echo "${EASYPASS}" #| base64


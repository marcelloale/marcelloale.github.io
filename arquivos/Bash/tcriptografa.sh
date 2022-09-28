#!/bin/bash
#tcrip
#testa a funcao criptografa

criptografa(){
SENHAFAZIL="${1}"
rnd0="19"
echo $SENHAFAZIL
for i in $(seq 0 "${rnd0}")
do
      SENHAFAZIL=$(sha224sum  <(echo -n "${SENHAFAZIL}") | cut -f 1 -d" " )
      echo
      echo "round$i: ${SENHAFAZIL}"
      echo
#teste visual
done

echo "${SENHAFAZIL}" #| base64

# rnd0 - Número de rounds sobre um hash. 19 por exemplo são 20 rounds, quanto maior esse valor mais robusta será sua passwd.
# você pode alterar o gerador de hash conforme sua conveniêcia sha256sum, sha224sum, md5sum, sha3sum, gostsum (russo)
}

read -p "username : " u1
read -sp "password : " p1
echo
echo "username : " $u1
echo "password : "  $p1

p1c=$(criptografa $p1)
echo $p1c
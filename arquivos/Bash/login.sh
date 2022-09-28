#!/bin/bash
#bmenu.sh
#script exemplo uma autenticacao com senhas criptografadas

#padrao do prompt select
PS3="escolha uma opção: "
echo "=== MENU ==="

#funções
criptografa(){
SENHAFAZIL="${1}"
rnd0="19"

for i in $(seq 0 "${rnd0}")
do
      SENHAFAZIL=$(sha224sum  <(echo -n "${SENHAFAZIL}") | cut -f 1 -d" " )
      #echo "${SENHAFAZIL}"
      #evolucao dentro do for
done

echo "${SENHAFAZIL}" #| base64
# rnd0 - Número de rounds sobre um hash. 19 por exemplo são 20 rounds.
# você pode alterar o gerador de hash conforme sua conveniêcia sha256sum, sha224sum, md5sum, sha3sum, gostsum (russo)
}

cadastra () {
  #read -p <prompt> <variavel> ler a entrada do usuario e colocar na variavel
  read -p "Digite seu nome de usuario: " log
  #-s permite que um usuário mantenha a entrada no modo silencioso e -p para inserir no novo prompt de comando
  read -sp "Digite sua senha: " sen
  echo #esse echo é apenas pra pular uma linha

  senc=$(criptografa "$sen")

  # uma string <usuario>:<senha> é escrita no arquivo oculto .senhas.db
  echo "$log:$senc" >> .senhas.db
  echo -e "\nO usuario $log foi incluindo no sistema!\n"
}

autentica (){
  read -p "Digite seu usuario: " login
  read -sp "Digite sua senha: " senha
  echo #pula linha

  senhac=$(criptografa "$senha")
  #pega a senha do usuario no arquivo de texto .senhas.db
  slogin=$(grep $login .senhas.db | cut -s -d":" -f2)

  if [ "$senhac" = "$slogin" ]; then
    echo "Login realizado com sucesso"
  else
    echo "A senha invalida"
  fi
}
#fim de funções

select i in cadastro login sair
do

   case "$i" in

      cadastro)
         #echo "inclui usuario e senha"
         cadastra
         ;;

      login)
         #echo "verifica usuario e senha"
         autentica
         ;;

      #alterar)
      #  echo "altera usuario"
      #  ;;

      #exclusao)
      #  echo "exclui usuario"
      #  ;;

      #consulta)
      #  echo "consulta usuario"
      #  ;;

      sair)
         echo "saindo do programa"
         break
         ;;

      *)
         echo "opcao invalida, tente de novo"
         ;;

   esac

done

exit 0
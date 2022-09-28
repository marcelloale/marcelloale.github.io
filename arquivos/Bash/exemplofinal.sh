#!/bin/bash

# Exemplo Final de Script Shell

#

 

Principal() {

  echo "Exemplo Final sobre o uso de scripts shell"

  echo "------------------------------------------"

  echo "Opções:"

  echo

  echo "1. Trasformar nomes de arquivos"

  echo "2. Adicionar um usuário no sistema"

  echo "3. Deletar um usuário no sistema"

  echo "4. Fazer backup dos arquivos do /etc"

  echo "5. Sair do exemplo"

  echo

  echo -n "Qual a opção desejada? "

  read opcao

  case $opcao in

    1) Transformar ;;

    2) Adicionar ;;

    3) Deletar ;;

    4) Backup ;;

    5) exit ;;

    *) "Opção desconhecida." ; echo ; Principal ;;

  esac

}

 

Transformar() {

  echo -n "Para Maiúsculo ou minúsculo? [M/m] "

  read var

  if [ $var = "M" ]; then

    echo -n "Que diretório? "

    read dir

 

    for x in `/bin/ls` $dir; do

      y=`echo $x | tr '[:lower:]' '[:upper:]'`

      if [ ! -e $y ]; then

        mv $x $y

      fi

    done

 

  elif [ $var = "m" ]; then

    echo -n "Que diretório? "

    read dir

 

    for x in `/bin/ls` $dir; do

      y=`echo $x | tr '[:upper:]' '[:lower:]'`

      if [ ! -e $y ]; then

        mv $x $y

      fi

    done

 

  fi

}

 

Adicionar() {

  clear

  echo -n "Qual o nome do usuário a se adicionar? "

  read nome

  adduser nome

  Principal

}

 

Deletar() {

  clear

  echo -n "Qual o nome do usuário a deletar? "

  read nome

  userdel nome

  Principal

}

 

Backup() {

  for x in `/bin/ls` /etc; do

    cp -R /etc/$x /etc/$x.bck

    mv /etc/$x.bck /usr/backup

  done

}
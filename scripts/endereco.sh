#!/bin/bash
# Autor: Danilo Neves
# E-mail: danilorpneves@outlook.com
#----------------------------------------------
# Esse script tem como objetivo baixar a longitude e latitude por CEP através da API do Google.
# O script vai ler o arquivo cep.txt, onde deve ter os CEPs linha por linha e assim entregar o resultado no arquivo outputcep.txt
# Fazendo teste
# Resultado:
# ./cepwhile.sh
# CEP: 30310080 lat -19.9389166 lng -43.9281785

url01=http://maps.google.com/maps/api/geocode/json?address=
url02=&sensor=false
while read cep
do
#       content=$(curl -s "{$url01}${cep}{$url02}" | grep "lat\|lng" |grep -n ^ | grep "^1:\|^2:" |cut -d: -f2,3 \
#       |sed 's/,//'| sed 's/://'|  xargs -L15 )

    content=$(curl -s "{$url01}${cep}{$url02}" |grep -n ^ )
    echo CEP: $cep $content
echo CEP: $cep $content >> outputcep.txt
done < endereco.txt

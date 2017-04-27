#!/bin/bash
# Autor: Danilo Neves
# E-mail: danilorpneves@outlook.com
#----------------------------------------------
# Esse script tem como objetivo baixar a longitude e latitude por ENDERECO através da API do Google.
# O script vai ler o arquivo endereco.txt, onde deve ter os endereços linha por linha e assim entregar o resultado no arquivo outputendereco.txt
# 
# Exemplo:
# Rodar script: ./endereco.sh
#
# Resultado do script: location lat 19.919816 lng 43.9518908

url01=http://maps.google.com/maps/api/geocode/json?address=
url02=&sensor=false
sed -i "s/ /+/g" endereco.txt
	while read cep
		do
		content=$(curl -s "{$url01}${cep}{$url02}" |grep -n ^ | grep -oP '\w+.\w+'  |sed '/^location/, / ^location/!d'  |head -5  |tr '\n' ' ')
	echo $content 
	echo $cep $content >> outputendereco.txt
	sed -i "s/+/ /g" outputendereco.txt
done < endereco.txt

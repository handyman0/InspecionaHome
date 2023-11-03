#!/bin/bash

###################################################################
#                                                                 #
# Nome: InspecionaHome.sh                                         #
#                                                                 #
# Autor: Luiz Fernando                                            #
# Data: 03/11/2023                                                #
#                                                                 #
# Descrição: Inspeciona os diretorios home em busca de arquivos   #
# com determinada extensões.                                      #
#                                                                 #
# Uso: ./InspecionaHome.sh                                        #
#                                                                 #
###################################################################

#Serão procurados arquivos do tipo .mp4, .mp3, .jpg

for user in /home/*
do
	MP4COUNT=0
	MP3COUNT=0
	JPGCOUNT=0
	OLDIFS=$IFS
	IFS=$'\n'
	for files in $(find $user -name '*.mp3' -o -name '*.mp4' -o -name '*.jpg')
	do
		case $files in
			*.mp4)
				MP4COUNT=$(expr $MP4COUNT + 1 )
				;;
			*.mp3)
				MP3COUNT=$(expr $MP3COUNT + 1)
				;;
			*.jpg)
				JPGCOUNT=$(expr $JGPCOUNT + 1)
				;;
		esac
	done #fim do for do find

echo "Usuario: $(basename $user)"
echo "Arquivos JPG: $JPGCOUNT"
echo "Arquivos MP3: $MP3COUNT"
echo "Arquivos MP4: $MP4COUNT"
echo
done # fim do for do /home

IFS=$OLDIFS

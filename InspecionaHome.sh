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

for user in /home/*; do
    MP4COUNT=0
    MP3COUNT=0
    JPGCOUNT=0
    USER=$(basename "$user")

    if [ ! -d "$user" ]; then
        echo "Erro: $USER não é um diretório válido."
        continue
    fi

    # Encontra os arquivos e armazena em arrays separados por tipo
    mapfile -t mp4_files < <(find "$user" -type f -name '*.mp4')
    mapfile -t mp3_files < <(find "$user" -type f -name '*.mp3')
    mapfile -t jpg_files < <(find "$user" -type f -name '*.jpg')

    # Conta os elementos nos arrays
    MP4COUNT=${#mp4_files[@]}
    MP3COUNT=${#mp3_files[@]}
    JPGCOUNT=${#jpg_files[@]}

    echo "Usuário: $USER"
    echo "Arquivos JPG: $JPGCOUNT"
    echo "Arquivos MP3: $MP3COUNT"
    echo "Arquivos MP4: $MP4COUNT"
    echo
done

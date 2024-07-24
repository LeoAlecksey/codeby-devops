#!/usr/bin/env bash
HOME_D="$HOME/myfolder"
if [ -e "$HOME_D" ]
then
    echo "Каталог $HOME_D уже существует, удалите его и перезапустите скрипт."
else
    mkdir "$HOME"/myfolder
    echo "Каталог $HOME_D создан"
    
    touch "$HOME_D"/1
    echo -e "Hello! \n$(date +"%Y-%m-%d_%H:%M")" >  "$HOME_D"/1
    echo "Файл $HOME_D/1 создан и наполнен"

    touch "$HOME_D"/2
    sudo chmod 777 "$HOME_D"/2
    echo "Файл $HOME_D/2 создан и установлены права 777"

    touch "$HOME_D"/3
    i=0
    while [ $i -lt 20 ]
    do
        echo -n $((1 + $RANDOM % 9)) >> "$HOME_D"/3
        i=$(( $i + 1))
    done
    echo "Файл $HOME_D/3 создан и наполнен"

    touch "$HOME_D"/4
    echo "Файл $HOME_D/4 создан"
    touch "$HOME_D"/5
    echo "Файл $HOME_D/5 создан"
fi

#• Создает папку myfolder в домашней папке текущего пользователя
#• Создает 5 файлов в папке:
#1 - имеет две строки: 1) приветствие, 2) текущее время и дата
#2 - пустой файл с правами 777
#3 - одна строка длиной в 20 случайных символов
#4-5 пустые файлы

#!/usr/bin/env bash
##########################################################
#                                                        #
#   Данный скрипт выполняет следующие действия:          #       
#                                                        #
#• Создает папку myfolder в домашней папке               #
#  текущего пользователя                                 #
#• Создает 5 файлов в папке:                             #
# 1 - имеет две строки:                                  #
#     1) приветствие,                                    #
#     2) текущее время и дата                            #
# 2 - пустой файл с правами 777                          #
# 3 - одна строка длиной в 20 случайных символов         #
# 4-5 пустые файлы                                       #
#                                                        #
##########################################################

SCRIPT_WORK_DIR="$HOME"/myfolder

if [ -e "$SCRIPT_WORK_DIR" ] # Определяет, существует ли каталог myfolder
then                         # Если каталог /myfolder существует
    echo "Выполнение скрипта завершено, каталог $SCRIPT_WORK_DIR уже существует, удалите его и перезапустите скрипт."

else                         # Если каталог /myfolder не существует
    mkdir "$HOME"/myfolder   # Создаем каталог /myfolder
    echo "Каталог $SCRIPT_WORK_DIR создан"
    
    touch "$SCRIPT_WORK_DIR"/1 # Создаем файл 1 в каталоге /myfolder
    echo -e "Hello! \n$(date +"%Y-%m-%d_%H:%M")" >  "$SCRIPT_WORK_DIR"/1 # Добавляем в файл 1 две строки приветствие и текущие дату/время
    echo "Файл $SCRIPT_WORK_DIR/1 создан и наполнен"

    touch "$SCRIPT_WORK_DIR"/2 # Создаем файл 2 в каталоге /myfolder
    sudo chmod 777 "$SCRIPT_WORK_DIR"/2 # Меняем разрешение на файл 2
    echo "Файл $SCRIPT_WORK_DIR/2 создан и установлены права 777"

    touch "$SCRIPT_WORK_DIR"/3 # Создаем файл 3 в каталоге /myfolder
    # Создаем цикл для наполнения первой строки в файле 3,
    # 20 случайными цифрами от 0 до 9.
    iteration=0 # первоначальное значение счетчика для цикла
    while [ $iteration -lt 20 ] 
    do
        echo -n $((1 + RANDOM % 9)) >> "$SCRIPT_WORK_DIR"/3
        iteration=$(( "$iteration" + 1))
    done
    echo "Файл $SCRIPT_WORK_DIR/3 создан и наполнен"

    touch "$SCRIPT_WORK_DIR"/4 # Создаем файл 4 в каталоге /myfolder
    echo "Файл $SCRIPT_WORK_DIR/4 создан"

    touch "$SCRIPT_WORK_DIR"/5 # Создаем файл 5 в каталоге /myfolder
    echo "Файл $SCRIPT_WORK_DIR/5 создан"
fi
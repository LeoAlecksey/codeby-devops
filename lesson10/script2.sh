#!/usr/bin/env bash
HOME_D="$HOME/myfolder"
if [ -e "$HOME_D" ]
then
   
    echo "Каталог $HOME_D существует."
    
    S=$(ls $HOME_D -1A | wc -l)
    echo "Количество файлов  в директории = $S"
    
    F=$(find "$HOME_D" -perm 777)
    chmod 644 "$F"
    echo "Права на файл $F изменены с 777 на 644"
    find "$HOME_D" -empty -type f -delete
    echo "Пустые файлы удалены и отсутствуют"
    for file in "$HOME_D"/*
    do
	D=$(sed '1! d' "$file")
	echo "$D" > "$file"
    done
    echo "Все строки кроме первой удалены"
    echo "..."
    echo "Выполнение скрипта завершено"
else
    echo "Каталога $HOME_D не существует, запустите script1.sh"
fi








#• Определяет, как много файлов создано в папке myfolder
#• Исправляет права второго файла с 777 на 664
#• Определяет пустые файлы и удаляет их
#• Удаляет все строки кроме первой в остальных файлах
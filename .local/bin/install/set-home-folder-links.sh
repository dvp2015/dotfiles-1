#!/bin/bash
pushd $HOME > /dev/null
declare -A folders
folders[Видео]=Movies
folders[Документы]=Documents
folders[Загрузки]=Downloads
folders[Изображения]=Pictures
folders[Музыка]=Music
folders[Общедоступные]=Public
folders[Рабочий стол]=Desktop
folders[Шаблоны]=Templates

for i in ${!folders[@]}; do
    target=${folders[$i]}
    [ -d $target ] || ln -s $i $target
done

popd > /dev/null

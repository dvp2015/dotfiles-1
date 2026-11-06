#!/bin/bash


make_link() {
  local src="$1"
  local dst="$2"
  if [[ ! -d $src ]]; then
    echo "$src is not a directory"
    return 1
  fi
  if [[ -r $dst ]]; then
    echo "$dst already exists"
    return 2
  fi
  ln -s $1 $2
}

make_link Видео Movies
make_link Изображения Pictures
make_link Документы Documents
make_link Музыка Music
make_link "Рабочий стол" Desktop
make_link Шаблоны Templates
make_link Загрузки Downloads
make_link Общедоступные Public


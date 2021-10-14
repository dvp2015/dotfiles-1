На экране "Добро пожаловать" - "Первые шаги" - установить Nvidia драйвер. Перезагрузка.
Обновить менеджер обновлений. Перезагрузка.
Обновить систему с менеджером. Перезагрузка.
Отчеты о системе, заглянул - предложено обновить мультимедиа кодеки, что и сделал.
Timeshift пока не запускаю.
Установил Chrome из deb файла ()
Добавил каталог ~/bin. Добавил в путь в установленном .bashrc. Сохранил исходный вариант .bashrc

Установил git:

sudo apt install git

Установил yadm:

git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
ln -s ~/.yadm-project/yadm ~/bin/yadm


Устaновил build-essential:

sudo apt update
sudo apt install build-essential


midnight commander установлен с помощью Program Mananager
Перезагрузка
Версия немного устарела, ставим из исходников
С помощью Synaptic установил glib2-dev, libslang2-dev.
./configure
Не стал отключать subshell. Посмотрим как поведет себя новая версия mc с zsh.
make
sudo make install


Загружаю свои dotfiles:
копирую .ssh каталог
yadm clone git@github.com:dvp2015/dotfiles-1.git

Устанавливаю zsh

sudo apt install zsh

chsh -s /bin/zsh


Проявились проблемы с недостающими программами
.zshenv:73 - нет ~/.cargo/env
проблемы с Powerlevel10k instant prompt
zsh_reload plugin is deperecated

vim - из репозитория не поддерживает clipboard, зато поддерживает арабский. Собрать и поставить последнюю версию.

Установил rust

cd ~/.local/bin/install
./rust

Исправилсь предупреждение .zshenv: 73

Закоментировал в .zshrc загрузку zsh_reload - исправился instant prompt

Устанавливаем diff-so-fancy ~/local/bin/install
./diff-so-fancy

... go
...
./go


./fzf


Установка nerd-fonts не прошла - указанные фонты отсутствуют.

configured p10k

Установил exa
./exa

Установил Droid Nerd Fonts 
./nerd-fonts

Исправилась выдача exa.

./bats

Собираем свой vim.
see https://github.com/vim/vim/blob/master/src/INSTALL

	% sudo apt install git
	% sudo apt install make
	% sudo apt install clang
	% sudo apt install libtool-bin

Сначала установил clang (10)
libtool-bin

Прогнал сборку vim, по history собрал скрипт ~/.local/bin/install/make-vim
(не проверял пока)
Заработала поддержка clipboard. Пришлось удалить vim из репозитория 

sudo apt remove vim
make-vim

Устанавливаю с помощью pyenv Python 3.9.7
Потребовалось установить libbz2-dev, openssl-dev, sqlite3-dev (Synaptic).

Установил Python 3.10.0

pyenv global system 3.9.7 3.10.0


Установил ripgrep, fd

cargo install ripgrep
cargo install fd



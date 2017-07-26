#!/usr/bin/env sh
# vim:ft=sh ts=2 sw=2 sts=2 et fenc=utf-8
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf 
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
valid_xfont_path=$( xset q | grep 'share/fonts' | awk -F ',' '{ print $1 }' )
sudo mv PowerlineSymbols.otf $valid_xfont_path
fc-cache -vf $valid_xfont_path
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Install awesome-patched fonts
# See: https://github.com/powerline/fonts
# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts


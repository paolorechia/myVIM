#!/bin/bash

# Assumes ubuntu-like box
# Installs deoplete deps
sudo apt install -y python3-pip
sudo apt install -y python3-setuptools
pip3 install wheel
pip3 install --user pynvim

# Python lint
sudo apt install pylint

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -s vimscript.vim 
./load.sh

#!/bin/bash


# Assumes ubuntu-like box
# Compile VIM from source code
sudo apt-get update
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

# Fuzzy finder depends on this ripgrep
sudo snap install ripgrep --classic

git clone https://github.com/vim/vim.git
cd vim
VIM_SOURCE_FOLDER=$(pwd)
git pull
./configure --with-features=huge
make
sudo make install
cd -

# Installs deoplete deps
sudo apt install -y python3-pip python3-setuptools pynvim pylint
pip3 install wheel
pip3 install --user pynvim

# Install Plugin Managers
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Configure VIM
# You might need to run it a few times to get everything installed.
vim -s vimscript.vim 
vim -s vimscript.vim 
vim -s vimscript.vim 
./load.sh

cat << EOF
Script finished! Welcome to the world of VIM :) 

If everything is working, it is now advised to execute the following commands:


cd ${VIM_SOURCE_FOLDER} 
sudo make clean
sudo make distclean

Enjoy :D
EOF


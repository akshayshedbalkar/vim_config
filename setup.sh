#!/bin/bash

if [  ! -f setup.sh ]
then
    echo "Error: Please execute this script from vim_config directory. Exiting ..."
    exit 0
fi

echo "Step 1: Initializing ..."
git submodule init

echo "Step 2: Updating ..."
git submodule update --remote --recursive

echo "Step 3: Creating swapfiles directory ..."
mkdir swapfiles

echo "Step 4: Backing up user .vim, vimrc and bashrc to folder .vim_config_backup ..."
mkdir ~/.vim_config_backup
mv ~/.vimrc ~/.vim_config_backup/.vimrc
mv ~/.bashrc ~/.vim_config_backup/.bashrc

cd ..
mv .vim ~/.vim_config_backup/.vim
mv vim_config .vim
cd .vim

echo "Step 6: Updating .vimrc and .bashrc ..."
ln -s .vimrc ~/.vimrc
ln -s .bashrc ~/.bashrc


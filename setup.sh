#!/bin/bash

##############################################################################################
if [  ! -f setup.sh ] then
    echo "Error: Please execute this script from vim_config directory. Exiting ..."
    exit 0
fi

##############################################################################################
echo -e "\nStep 1/6: Initializing ..."
git submodule init

##############################################################################################
echo -e "\nStep 2/6: Updating ..."
git submodule update --remote --recursive

##############################################################################################
echo -e "\nStep 3/6: Creating swapfiles directory ..."
if [ ! -d swapfiles ] then
    mkdir swapfiles
fi

##############################################################################################
echo -e "\nStep 4/6: Backing up user .vim, vimrc and bashrc to folder .vim_config_backup ..."
if [ ! -d "$HOME/.vim_config_backup" ] then
    mkdir "$HOME/.vim_config_backup"
fi

if [ ! -L "$HOME/.vimrc" ] then
    mv "$HOME/.vimrc" "$HOME/.vim_config_backup/.vimrc"
else
    rm "$HOME/.vimrc"
fi

if [ ! -L "$HOME/.bashrc" ] then
    mv "$HOME/.bashrc" "$HOME/.vim_config_backup/.bashrc"
else
    rm "$HOME/.bashrc"
fi

if [ -d "$HOME/.vim" ] then
    mv "$HOME/.vim" "$HOME/.vim_config_backup/.vim"
fi

##############################################################################################
echo -e "\nStep 5/6: Setting up new $HOME/.vim directory ..."
cp -r "$PWD" "$HOME/.vim"

##############################################################################################
echo -e "\nStep 6/6: Updating user .vimrc and .bashrc ..."
ln -s "$PWD/.vimrc" "$HOME/.vimrc"
ln -s "$PWD/.bashrc" "$HOME/.bashrc"

##############################################################################################
echo -e "Done! You can safely delete the vim_config folder."

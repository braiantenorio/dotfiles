#!/bin/bash
dotfilesDir=$(pwd)

function linkDotfile {
  if [ $# -eq 1 ]; then
    echo "Recibido 1 argumento"
    dest="${HOME}/${1}"
  elif [ $# -eq 2 ]; then
	echo "Recibo 2 argumentos"
    dest="${HOME}/${2}/${1}"    
  fi

  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h "${dest}" ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .vimrc
linkDotfile .bashrc
linkDotfile .gitconfig
linkDotfile .tmux.conf
linkDotfile .curlrc
linkDotfile .zshrc
linkDotfile .wezterm.lua
linkDotfile kitty.conf .config/kitty

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

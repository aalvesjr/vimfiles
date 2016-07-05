#!/bin/bash

VIMFILES_PATH=${HOME}/.vim
VIMRC=${HOME}/.vimrc
VIMFILES_URL='https://github.com/aalvesjr/vimfiles.git'

echo "Clonando vimfiles de ${VIMFILES_URL}"
git clone ${VIMFILES_URL} ${HOME}/.vim-tmp

if [[ $? -eq 0 ]]; then
  if [[ -d ${VIMFILES_PATH} ]]; then
    echo "Já existia uma instalação anterior do vim, movendo '${VIMFILES_PATH}' para '${HOME}/.vim-old'"
    mv ${VIMFILES_PATH} ${HOME}/.vim-old
  fi

  mv ${HOME}/.vim-tmp $VIMFILES_PATH

  echo "Clonando 'Vundle.vim' ..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  if [[ -s ${VIMRC} ]]; then
    echo "Movendo '${VIMRC}' anterior para '${HOME}/.vimrc-old'"
    mv ${VIMRC} ${HOME}/.vimrc-old
  fi

  echo "Criando link de '~/.vim/vimrc' para '~/.vimrc'"
  ln -s ${VIMFILES_PATH}/vimrc ${HOME}/.vimrc

  echo "Instalando Plugins ..."
  vim +PluginInstall +qall

  echo "[ OK ] VIM configurado!"

fi

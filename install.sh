#!/bin/bash

VIMFILES_PATH=${HOME}/.vim
VIMRC=${HOME}/.vimrc
VIMFILES_URL='https://github.com/aalvesjr/vimfiles.git'

echo "Cloning vimfiles from ${VIMFILES_URL}"
git clone ${VIMFILES_URL} ${HOME}/.vim-tmp

if [[ $? -eq 0 ]]; then
  if [[ -d ${VIMFILES_PATH} ]]; then
    echo "Already exists one previous installation of vim, moving '${VIMFILES_PATH}' to '${HOME}/.vim-old'"
    mv ${VIMFILES_PATH} ${HOME}/.vim-old
  fi

  mv ${HOME}/.vim-tmp $VIMFILES_PATH

  echo "Cloning 'Vundle.vim' ..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  if [[ -s ${VIMRC} ]]; then
    echo "Moving previous '${VIMRC}' to '${HOME}/.vimrc-old'"
    mv ${VIMRC} ${HOME}/.vimrc-old
  fi

  echo "Creating link from '~/.vim/vimrc' to '~/.vimrc'"
  ln -s ${VIMFILES_PATH}/vimrc ${HOME}/.vimrc

  echo "Installing Plugins ..."
  vim +PluginInstall +qall +GoInstallBinaries > /dev/null 2>&1

  echo "[ OK ] VIM configured!"

fi

#!/bin/bash

VIMFILES_PATH=${HOME}/.vim
VIMRC=${HOME}/.vimrc
VIMFILES_URL='https://github.com/aalvesjr/vimfiles.git'
VIMTMP=${HOME}/.vim-tmp
VIM_OLD=${HOME}/.vim-old
VIMRC_OLD=${HOME}/.vimrc-old

echo "Cloning vimfiles from ${VIMFILES_URL}"
git clone ${VIMFILES_URL} ${VIMTMP}

if [[ $? -eq 0 ]]; then
  if [[ -d ${VIM_OLD} ]]; then rm -rf ${VIM_OLD} ; fi
  if [[ -f ${VIMRC_OLD} ]]; then rm -df ${VIMRC_OLD} ; fi

  if [[ -d ${VIMFILES_PATH} ]]; then
    echo "Already exists one previous installation of vim, moving '${VIMFILES_PATH}' to '${VIM_OLD}'"
    mv ${VIMFILES_PATH} ${VIM_OLD}
  fi

  mv ${HOME}/.vim-tmp $VIMFILES_PATH

  echo "Cloning 'Vundle.vim' ..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  if [[ -s ${VIMRC} ]]; then
    echo "Moving previous '${VIMRC}' to '${VIMRC_OLD}'"
    mv ${VIMRC} ${VIMRC_OLD}
  fi

  echo "Creating link from '~/.vim/vimrc' to '~/.vimrc'"
  ln -s ${VIMFILES_PATH}/vimrc ${VIMRC}

  echo "Installing Plugins ..."
  vim +PluginInstall +GoInstallBinaries +qall > /dev/null 2>&1

  echo "[ OK ] VIM configured!"

fi

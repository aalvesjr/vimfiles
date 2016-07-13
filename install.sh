#!/bin/bash

VIMFILES_PATH="${HOME}/.vim"
VIMRC="${HOME}/.vimrc"
VIMFILES_URL='https://github.com/aalvesjr/vimfiles.git'
VIMTMP="${HOME}/.vim-tmp"
VIM_OLD="${HOME}/.vim-old"
VIMRC_OLD="${HOME}/.vimrc-old"

NC="\033[0m"
GREEN="\033[0;32m"
RED="\033[0;31m"

STATUS_OK="\033[100G[ ${GREEN}OK${NC} ]"
STATUS_FAIL="\033[100G[ ${RED}FALHOU${NC} ]"

check () {
  if [ $? -eq 0 ]; then
    echo -e "$STATUS_OK"
  else
    echo -e "$STATUS_FAIL"
    echo "Script Aborted!"
    exit 1
  fi
}

echo -n "Cloning vimfiles from ${VIMFILES_URL}"
if [ -d ${VIMTMP} ]; then rm -rf ${VIMTMP} ; fi

git clone ${VIMFILES_URL} ${VIMTMP} > /dev/null 2>&1
check

if [ -d ${VIMTMP} ]; then
  if [ -d ${VIM_OLD} ]; then rm -rf ${VIM_OLD} ; fi

  if [ -d ${VIMFILES_PATH} ]; then
    echo -n "Moving previous installation, '${VIMFILES_PATH}' to '${VIM_OLD}'"
    mv ${VIMFILES_PATH} ${VIM_OLD}
    check
  fi

  mv ${HOME}/.vim-tmp $VIMFILES_PATH

  echo -n "Cloning 'Vundle.vim' ..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1
  check

  if [ -s ${VIMRC} ]; then
    echo -n "Moving previous '${VIMRC}' to '${VIMRC_OLD}'"
    mv ${VIMRC} ${VIMRC_OLD}
    check
  fi

  echo -n "Creating link from '~/.vim/vimrc' to '~/.vimrc'"
  ln -sf ${VIMFILES_PATH}/vimrc ${VIMRC}
  check

  echo -n "Installing Plugins ..."
  vim +PluginInstall +GoInstallBinaries +qall > /dev/null 2>&1
  check

  echo "VIM configured!"

fi

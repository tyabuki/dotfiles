#!/bin/bash
set -eu

if [ ! -e ~/.zshrc ];then
  ln -sv `pwd`/zshrc ~/.zshrc
fi

if [ ! -e ~/.tmux.conf ];then
  ln -sv `pwd`/tmux.conf ~/.tmux.conf
fi

if [ ! -e ~/.gitconfig_common ];then
  ln -sv `pwd`/gitconfig_common ~/.gitconfig_common
fi

if [ ! -e ~/.gitconfig ];then
  cp `pwd`/gitconfig_template ~/.gitconfig
fi

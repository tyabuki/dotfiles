#!/bin/bash
set -eu

if [ ! -e ~/.zshrc_mac ];then
  ln -sv `pwd`/zshrc_mac ~/.zshrc_mac
fi

if [ ! -e ~/.tmux_mac.conf ];then
  ln -sv `pwd`/tmux_mac.conf ~/.tmux_mac.conf
fi

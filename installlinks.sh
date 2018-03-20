#!/bin/bash
if [ ! -e ~/.consolefont.sh ]
then
  ln -s ~/.gitdotfiles/.consolefont.sh ~/.consolefont.sh
fi
if [ ! -e ~/.minttyrc ]
then
  ln -s ~/.gitdotfiles/.minttyrc ~/.minttyrc
fi
if [ ! -e ~/.Xresources ]
then
  ln -s ~/.gitdotfiles/.Xresources ~/.Xresources
fi
if [ ! -e ~/.shellprompt.sh ]
then
  ln -s ~/.gitdotfiles/.shellprompt.sh ~/.shellprompt.sh
fi
if [ ! -e ~/.tmux ]
then
  ln -s ~/.gitdotfiles/.tmux ~/.tmux
fi
if [ ! -e ~/.tmux.conf ]
then
  ln -s ~/.gitdotfiles/.tmux.conf ~/.tmux.conf
fi
if [ ! -e ~/.tmuxtheme.conf ]
then
  ln -s ~/.gitdotfiles/.tmuxtheme.conf ~/.tmuxtheme.conf
fi
if [ ! -e ~/.zshrc ]
then
  ln -s ~/.gitdotfiles/.zshrc ~/.zshrc
fi
if [ ! -e ~/.fzf.zsh ]
then
  ln -s ~/.gitdotfiles/.fzf.zsh ~/.fzf.zsh
fi

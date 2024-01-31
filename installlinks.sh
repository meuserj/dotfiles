#!/bin/bash
if [[ ! -e ~/.alacritty.yml ]]
then
  ln -s ~/.gitdotfiles/.alacritty.yml ~/.alacritty.yml
fi
if [[ ! -e ~/.alacritty.toml ]]
then
  ln -s ~/.gitdotfiles/.alacritty.toml ~/.alacritty.toml
fi
if [[ ! -e ~/.consolefont.sh ]]
then
  ln -s ~/.gitdotfiles/.consolefont.sh ~/.consolefont.sh
fi
if [[ ! -e ~/.minttyrc ]]
then
  ln -s ~/.gitdotfiles/.minttyrc ~/.minttyrc
fi
if [[ ! -e ~/.Xresources ]]
then
  ln -s ~/.gitdotfiles/.Xresources ~/.Xresources
fi
if [[ ! -e ~/.shellprompt.sh ]]
then
  ln -s ~/.gitdotfiles/.shellprompt.sh ~/.shellprompt.sh
fi
if [[ ! -e ~/.tmux ]]
then
  ln -s ~/.gitdotfiles/.tmux ~/.tmux
fi
if [[ ! -e ~/.tmux.conf ]]
then
  ln -s ~/.gitdotfiles/.tmux.conf ~/.tmux.conf
fi
if [[ ! -e ~/.tmuxtheme.conf ]]
then
  ln -s ~/.gitdotfiles/.tmuxtheme.conf ~/.tmuxtheme.conf
fi
if [[ ! -e ~/.zshrc ]]
then
  ln -s ~/.gitdotfiles/.zshrc ~/.zshrc
fi
if [[ -L ~/.fzf.zsh && -e ~/.gitdotfiles/.fzf.zsh ]]
then
  rm -f ~/.fzf.zsh
  mv ~/.gitdotfiles/.fzf.zsh ~/.fzf.zsh
fi
if [[ ! -e ~/.vim ]]
then
  ln -s ~/.vimgit ~/.vim
fi
if [[ ! -e ~/.vimrc ]]
then
  ln -s ~/.vim/init.vim ~/.vimrc
fi
if [[ ! -e ~/.config/nvim ]]
then
  mkdir -p ~/.config
  ln -s ~/.vim ~/.config/nvim
fi
if [[ ! -d ~/bin ]]
then
  mkdir -p ~/bin
fi
if [[ ! -L ~/bin/upgrade.sh ]]
then
  rm -f ~/bin/upgrade.sh
  ln -s ~/.gitdotfiles/upgrade.sh ~/bin/upgrade.sh
fi
if [[ ! -L ~/bin/fff ]]
then
  rm -f ~/bin/fff
  ln -s ~/.gitdotfiles/fff/fff ~/bin/fff
fi
if [[ ! -L ~/bin/neofetch ]]
then
  rm -f ~/bin/neofetch
  ln -s ~/.gitdotfiles/neofetch/neofetch ~/bin/neofetch
fi

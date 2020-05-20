#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]
then
  if command -v apt
  then
    sudo apt -y update
    sudo apt -y autoremove
    sudo apt -y upgrade
    sudo apt -y autoremove
  elif command -v yum
  then
    sudo yum update
    sudo yum upgrade
  fi
  if command -v gnome-shell-extension-installer
  then
    gnome-shell-extension-installer --yes --update --restart-shell
  fi
elif [[ "$OSTYPE" == "darwin"* ]]
then
  if command -v brew
  then
    brew update
    brew upgrade
  fi
elif [[ "$OSTYPE" == "cygwin" ]]
then
  wget -N http://cygwin.com/setup-x86_64.exe && ./setup-x86_64.exe --no-desktop --no-shortcuts --no-startmenu --quiet-mode && rm -f setup-x86_64.exe
fi
pushd ~/.vimgit
git pull
popd
pushd ~/.gitdotfiles
git pull
git submodule update --remote
git submodule foreach git checkout master
git submodule foreach git pull
./installlinks.sh
popd
vim -i NONE -c 'PlugClean!' -c 'PlugUpdate!' -c 'PlugUpgrade!' -c quitall
zsh ~/.gitdotfiles/oh-my-zsh/tools/upgrade.sh
~/.tmux/plugins/tpm/bin/clean_plugins
~/.tmux/plugins/tpm/bin/update_plugins all
~/.tmux/plugins/tpm/bin/install_plugins

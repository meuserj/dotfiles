#!/bin/bash
while getopts "o" opt
do
  case ${opt} in
    o )
      os="yes"
      ;;
    * )
      os="no"
      ;;
  esac
done

if [[ "$OSTYPE" == "linux-gnu" ]]
then
  if command -v apt && [[ "$os" == "yes" ]]
  then
    sudo apt -y update
    sudo apt -y autoremove
    sudo apt -y upgrade
    sudo apt -y autoremove
  elif command -v yum && [[ "$os" == "yes" ]]
  then
    sudo yum update
    sudo yum upgrade
  fi
  if command -v snap
  then
      sudo snap refresh
  fi
  if command -v flatpak
  then
    sudo flatpak -y update
  fi
  if command -v gnome-shell-extension-installer
  then
    gnome-shell-extension-installer --yes --update --restart-shell
  fi
elif [[ "$OSTYPE" =~ "darwin" ]]
then
  if command -v brew
  then
    brew update
    brew cleanup
    brew upgrade
    if [[ "$os" == "yes" ]]
    then
      sudo softwareupdate -i -a
    fi
  fi
  if command -v mas
  then
    mas upgrade
  fi
elif [[ "$OSTYPE" == "cygwin" ]] && [[ "$os" == "yes" ]]
then
  wget -N http://cygwin.com/setup-x86_64.exe && ./setup-x86_64.exe --no-desktop --no-shortcuts --no-startmenu --quiet-mode && rm -f setup-x86_64.exe
fi
pushd ~/.vimgit
git stash
git pull
git stash pop
popd
pushd ~/.gitdotfiles
git stash
git pull
git submodule init
git submodule update --remote
git submodule foreach git checkout master
git submodule foreach git pull
./installlinks.sh
git stash pop
popd
if [[ -e $(type -P vim) ]]
then
  $(type -P vim) -i NONE -c 'PlugClean!' -c 'PlugUpdate!' -c 'PlugUpgrade!' -c quitall
fi
if [[ -e $(type -P nvim) ]]
then
  $(type -P nvim) -i NONE -c 'PlugClean!' -c 'PlugUpdate!' -c 'PlugUpgrade!' -c quitall
fi
zsh ~/.gitdotfiles/oh-my-zsh/tools/upgrade.sh
~/.tmux/plugins/tpm/bin/clean_plugins
~/.tmux/plugins/tpm/bin/update_plugins all
~/.tmux/plugins/tpm/bin/install_plugins

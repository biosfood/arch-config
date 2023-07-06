#!/bin/bash

read -p "Do you want to install essential packages? (y / N): "

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Installing bare essenital programs using paru..."
	sudo pacman -S tree vi gnupg nodejs python3 python-pip wget unzip xclip ephoto flameshot postgresql --noconfirm
	paru -S pulse-browser-bin tbsm zettlr vim-plug-neo dolphin-tabopts audacity meld snapd barrier android-sdk-platform-tools xdotool easyeda --noconfirm
    pip3 install neovim
    sudo systemctl enable --now snapd.socket
fi

read -p "Do you want to install KDE utilities? (y / N): "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    paru -S konsole konsave kmail krita kaffeine partitionmanager calligra imath --noconfirm
fi

read -p "Do you want to install yarn? (y / N): "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -o- -L https://yarnpkg.com/install.sh | bash
fi

read -p "Do you want to insert default configuration files? (y / N): "

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Inserting configuration for Konsole . . ."
	cp .local/share/konsole/Profile\ 1.profile ~/.local/share/konsole/Profile\ 1.profile

	echo "Importing plasma desktop configuration"
    konsave -r plasmaConfig
	konsave -i plasmaConfig.knsv
	konsave -a plasmaConfig

  echo "Inserting neovim setup script . . ."
  cp .config/nvim/init.vim ~/.config/nvim/
  
    echo "Moving barrier configuration file..."
    cp ./barrier.conf ~
fi

read -p "Do you want to install the custom font? (y / N): "
if [[ $REPLY =~ ^[Yy]$ ]]
then
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip
  unzip JetBrainsMono.zip -d ~/.fonts
  sudo fc-cache -f -v
  rm JetBrainsMono.zip
fi

read -p "Do you want to install some LSP language servers? (y / N): "
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo pacman -S pyright npm --noconfirm
  sudo npm install -g typescript typescript-language-server
  paru -S neovim-coc-bin --noconfirm
fi

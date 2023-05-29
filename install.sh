#!/bin/bash

read -p "Do you want to install essential packages? (y / N): "

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Installing bare essenital programs using paru..."
	sudo pacman -S tree vi gnupg nodejs python3 python-pip wget unzip --noconfirm
	paru -S pulse-browser-bin konsole tbsm zettlr konsave vim-plug-neo --noconfirm
    pip3 install neovim
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
fi


read -p "Do you want to install the custom font? (y / N): "

if [[ $REPLY =~ ^[Yy]$ ]]
then
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip
  unzip JetBrainsMono.zip -d ~/.fonts
  sudo fc-cache -f -v
  rm JetBrainsMono.zip
fi

#!/bin/bash

read -p "Do you want to install essential packages? (y / N): "

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Installing bare essenital programs using paru..."
	sudo pacman -S tree vi gnupg nodejs python3 python-pip wget unzip xclip ephoto flameshot --noconfirm
	paru -S pulse-browser-bin konsole tbsm zettlr konsave vim-plug-neo dolphin-tabopts audacity meld snapd barrier --noconfirm
    pip3 install neovim
    sudo systemctl enable --now snapd.socket
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

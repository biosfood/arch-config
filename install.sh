#!/bin/bash

read -p "Do you want to install essential packages? (y / N): "

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Installing bare essenital programs using paru..."
	sudo pacman -S tree --noconfirm
	paru -S pulse-browser-bin konsole tbsm zettlr --noconfirm
fi

read -p "Do you want to insert default configuration files? (y / N): "

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Inserting configuration for Konsole . . ."
	cp .local/share/konsole/Profile\ 1.profile ~/.local/share/konsole/Profile\ 1.profile
fi

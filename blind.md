# Blind installation
This document covers the main steps to be taken while no internet connection, GUI, git and other essential tools have been set up. This is why most of these commands have to be input manually

## USB stick preparation

First up, download an arch linux ISO file from [https://archlinux.org/download/](https://archlinux.org/download/). Then use your favourite ISO burning utility to burn the image file to a USB stick with at least 1GB of free space.

## Arch linux installation

Insert the USB-stick into a fitting port on the target machine and boot into the Arch-linux operating system.

For further installation, you will need internet access. Either pug in a wired connection or run `iwctl`. 

Find your ethernet adapter using `device list`, scan for available networks with `adapter <adapter> scan`, list them using `adapter <adapter> get-networks` and connect to your wifi with `adapter <adapter> connect <UUID>`.

To install arch linux, start the program `archinstall` and fill out all fields according to your need. When selecting the target drive, the program will take some time to display the next menu, where you can decide how the OS will be installed. Choose the `minimal` profile to start out with some basic packages and select the Network manager for internet connection.

Then, confirm the installation and after it is finshed, restart your machine. The USB stick is no longer needed.

## Desktop setup

After booting into the frest Arch installation, log into your user account. Then, setup an internet connection, either using a wired connection or with the `Network manager` utiltity. In the command line, run `nmcli device wifi list` to list available wireless networks and connect to one using `nmcli device wifi connect <SSID> password <password>`.

Next up, install git using `pacman -S base-devel` and a text editor of your choice, I like nvim: `pacman -S neovim`.

You will also need a way to install AUR packages. For this, clone the `paru` project:
```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

After this, the `paru` folder can be removed again, it is no longer needed. Then, setup your git user configuration:

```bash
ssh-keygen
git config --global user.name "<username>"
git config --global user.email "<email>"
```

At this point, you can get the remaingin configuration files from this project using `git clone https://github.com/biosfood/arch-config.git`.

Next up, install a display manager (I'm using tbsm), the X server and a desktop environment (This manual is using KDE plasma) as well as a terminal emulator:

```bash
paru -S tbsm konsole
pacman -S xorg-server xorg xorg-init xorg-xinit plasma
```

After copying `.bashrc` from this repository to your home folder, tbsm will be automatically started when starting your computer. Select the KDE plasma option to go to the Desktop. Open the `Konsole` program to get a console for further configuration.

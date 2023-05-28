# Blind installation
This document covers the main steps to be taken while no internet connection, GUI, git and other essential tools have been set up. This is why most of these commands have to be input manually

## USB stick preparation

First up, download an arch linux ISO file from [https://archlinux.org/download/](https://archlinux.org/download/). Then use your favourite ISO burning utility to burn the image file to a USB stick with at least 1GB of free space.

## Arch linux installation

Insert the USB-stick into a fitting port on the target machine and boot into the Arch-linux operating system.

For further installation, you will need internet access. Either pug in a wired connection or run `iwctl`. 

Find your ethernet adapter using `device list`, scan for available networks with `adapter <adapter> scan`, list them using `adapter <adapter> get-networks` and connect to your wifi with `adapter <adapter> connect <UUID>`.

To install arch linux, start the program `archinstall` and fill out all fields according to your need. When selecting the target drive, the program will take some time to display the next menu, where you can decide how the OS will be installed. 
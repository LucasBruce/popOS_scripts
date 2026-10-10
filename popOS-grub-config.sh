#!/bin/bash

sudo fdisk -l; sudo lsblk /dev/nvme0n1
sudo mkdir /mnt/windows
sudo mount /dev/nvme0n1p1 /mnt/windows
sudo cp -r /mnt/windows/EFI/microsoft /boot/efi/EFI
sudo nano /boot/efi/loader/loader.conf
timeout 8
console-mode max
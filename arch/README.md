# Arch

- [arch](https://archlinux.org/)
- [wiki](https://wiki.archlinux.org/)
  - [install](https://wiki.archlinux.org/title/Installation_guide)
- [manual](https://man.archlinux.org/)
- [download](https://archlinux.org/download/)

## Start

### Partition the disks

```bash
fdisk -l

Disk /dev/nvme0n1: 999.99 GiB
Disk model: Samsung SSD
# ...
```

```bash
lsblk --fs

NAME        FSTYPE   FSVER LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
loop0       squashfs 4.0                                                    0   100% /run/archiso/airootfs
sda
└─sda1      ntfs           Data
nvme0n1
# ...
```

```bash
fdisk /dev/nvme0n1
```

#### GPT Disklabel type

```bash
p # print the partition table

g # create a new empty GPT partition table
Created a new GPT disklabel.
```

#### EFI system partition

- [EFI system partition](https://wiki.archlinux.org/title/EFI_system_partition)

```bash
n # add a new partition
Partition number (default 1):
First sector (default 2048):
Last sector: +1G

Created a new partition 1 of type 'Linux filesystem' and of size 1 GiB.
Partition #1 contains a vfat signature.

Do you want to remove the signature? [Y]es/[N]o: y

The signature will be removed by a write command.
```

#### Boot Partition

```bash
n # add a new Partition
Partition number (default 2):
First sector (default 2099200):
Last sector: +1G
```

#### Root Partition

```bash
n # add a new Partition
Partition number (default 3):
First sector (default 2099200):
Last sector:
```

#### (Optional) Type the partitions

```bash
t # change a partition table
Partition number (default 3):
Partition type or alias (type L to list all): 44

Changed type of partition 'Linux filesystem' to 'Linux LVM'.
```

#### Partition Table

```bash
/dev/nvme0n1p1 1G   Linux filesystem
/dev/nvme0n1p2 1G   Linux filesystem
/dev/nvme0n1p3 997G Linux filesystem
# /dev/nvme0n1p3 997G Linux LVM
```

#### Write the changes

```bash
w # write table to disk and exit
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

### Format the partitions

```bash
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
```

### Install Arch Linux

#### Mount the file systems

```bash
mount /dev/nvme0n1p3 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot
```

#### Install essential packages

```bash
pacstrap -K /mnt base linux linux-lts linux-firmware linux-headers linux-lts-headers
```

#### Configure the system

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

#### Chroot

```bash
arch-chroot /mnt
passwd
```

#### Time zone

```bash
date

Sat Nov 2 14:00:00 UTC 2024
```

```bash
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
hwclock --systohc
```

```bash
date

Sat Nov 2 23:00:00 KST 2024
```

#### Add a user

```bash
useradd -m -g users -G wheel username
passwd username
```

#### Install Packages

```bash
lspci
```

```bash
pacman -S base-devel sudo vim grub efibootmgr dosfstools mtools os-prober
pacman -S networkmanager openssh
pacman -S amd-ucode
```

#### Localization

Uncomment:
- en_US.UTF-8 UTF-8
- ko_KR.UTF-8 UTF-8

```bash
vim /etc/locale.gen
locale-gen
```

```bash
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

#### Network Manager

```bash
echo hostname > /etc/hostname
```

```bash
systemctl enable NetworkManager
```

#### Install Boot Loader

```bash
mkinitcpio -p linux
mkinitcpio -p linux-lts
```

#### Grub

```bash
mkdir /efi
mount /dev/nvme0n1p1 /efi
grub-install --target=x86_64-efi --bootloader-id=LINUX --efi-directory=/efi --recheck
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
```

### Reboot

```bash
exit
umount -a
reboot
```


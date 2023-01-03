# Arch

## Raspberry Pi 4

- Raspberry Pi 4: [Specifications](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/specifications/)
- Arch Linux ARM
   - Raspberry Pi 4 [Installation](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4)
   - [Downloads](https://archlinuxarm.org/about/downloads)

ARMv8 Raspberry Pi 3/4: `ArchLinuxARM-rpi-aarch64-latest.tar.gz`

### SD card

```bash
sudo fdisk -l

Disk /dev/sdb: 29.73 GiB, 31927042048 bytes, 62357504 sectors
```

```bash
sudo fdisk /dev/sdb

p # list partitions
o # clear out all partitions

p # list partitions. no partitions left.
```

####  first partition

```bash
n # add a new partition
p # primary (0 primary, 0 extended, 4 free)
1 # partition number
# enter. first sector default: 2048
+200M # last sector
```

#### change first partition type

```bash
t # change a partition type
c # 0c W95 FAT32 (LBA)

# Changed type of partition 'Linux' to 'W95 FAT32 (LBA)'.
```

#### second partition

```bash
n # add a new partition
p # primary (1 primary, 0 extended, 3 free)
1 # partition number
# enter. first sector default: 411648
# enter. last sector default: 62357503
```

#### Write the partiton table

```bash
p # list partitions
w # write table to disk and exit
```

Result:

```bash
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

#### Create and mount the FAT filesystem

```bash
sudo mkfs.vfat /dev/sdb1
mkdir boot
sudo mount /dev/sdb1 boot
```

#### Create and mount the ext4 filesystem

```bash
sudo mkfs.ext4 /dev/sdb2
# wait: Creating journal (32768 blocks): done

mkdir root
sudo mount /dev/sdb2 root
```

#### Extract the root file system

as root, not via sudo:

```bash
sudo su
```

option: `apt install libarchive-tools`

```bash
bsdtar -xpf ArchLinuxARM-rpi-aarch64-latest.tar.gz -C root
sync
```

#### Move boot files to the first partition

```bash
mv root/boot/* boot
```

#### for AArch64 Image

This provides an installation using the mainline kernel and U-Boot. Use this installation only if you have no dependencies on the closed source vendor libraries shipped in the ARMv7 release. This installation has near full support for the device, including the VC4 graphics.

```bash
cat root/etc/fstab

# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
/dev/mmcblk0p1  /boot   vfat    defaults        0       0
```

```bash
sed -i 's/mmcblk0/mmcblk1/g' root/etc/fstab
```

```bash
# <file system> <dir> <type> <options> <dump> <pass>
/dev/mmcblk0p1  /boot   vfat    defaults        0       0
```

#### Unmount the two partitions

```bash
umount boot root
```

#### Insert SD card into Raspberry Pi

- user: `alarm`
- password: `alarm`
- root: `root`

#### pacman keyring

Initialize the pacman keyring and populate the Arch Linux ARM package signing keys

```bash
pacman-key --init
pacman-key --populate archlinuxarm
```

# VirtualBox

- virtualbox: [linux](https://www.virtualbox.org/wiki/Linux_Downloads)

Add the Oracle VirtualBox repository:

```bash
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
```

Update APT:

```bash
sudo apt update
sudo apt search virtualbox
```

Install VirtualBox:

```bash
sudo apt install virtualbox-7.0
```

## Setup

1. Open VirtualBox
2. Preferences
3. Default Machine Folder: `~/vm/virtualbox`
4. Check for updates: Once a month


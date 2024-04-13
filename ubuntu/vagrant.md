# Vagrant

- [install](https://developer.hashicorp.com/vagrant/install)
- [search](https://app.vagrantup.com/boxes/search)

## Install

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

## Setup

```bash
mkdir ~/vm/guests
```

```bash
mkdir ~/vm/guests/bento/centos-7.9
cd ~/vm/guests/bento/centos-7.9
```

```bash
vagrant init bento/centos-7.9
vagrant up
```


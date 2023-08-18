# FreeBSD

## Network

### /etc/rc.conf

```bash
ifconfig_em1="inet 192.168.13.2 netmask 255.255.255.0"
```

## User

### su

```bash
pw group show -n wheel
# wheel:*:0:root

pw group mod -n wheel -m $USER

pw group show -n wheel
# wheel:*:0:root,$USER
```

---

## Upgrade Minor Version

```bash
uname -r # 13.1-RELEASE

sudo freebsd-update -r 13.2-RELEASE upgrade
sudo freebsd-update install
shutdown -r now
sudo freebsd-update install
```

```bash
uname -r

13.2-RELEASE-p2
```

---

## Apply security patches

```bash
sudo su
export PAGER=cat
freebsd-update --not-running-from-cron fetch
freebsd-update install
```

---

## Packages

### ports

Frist time:

```bash
sudo portsnap fetch extract update
```

Update:

```bash
sudo portsnap fetch update
```

#### search

```bash
# 1.
whereis nginx

# 2.
cd /usr/ports
make search name=nginx

# 3.
echo /usr/ports/*/*nginx*

# 4.
psearch lsof
psearch -l lsof
```

#### install the port

```bash
cd /usr/ports/ports-mgmt/psearch
sudo make install clean
```

#### remove the port

```bash
cd /usr/ports/ports-mgmt/psearch
sudo make deinstall
sudo make rmconfig
```

#### update ports

```bash
# install portmaster
cd /usr/ports/ports-mgmt/portmaster
sudo make install clean
# or
sudo pkg install portmaster

# update the ports tree
sudo portsnap fetch update
portmaster -L
portmaster -a  # upgrade all ports
portmaster -ad # clean distfile
portmaster sudo # upgrade only sudo port
```

### pkg

Installed packages:

```bash
pkg info
```

Outdated:

```bash
pkg version -l "<"
pkg version -vIL=
```

Upgrade:

```bash
sudo pkg update # -f
sudo pkg upgrade
```

---

## CLI Tools

### curl

```bash
sudo pkg install curl
```


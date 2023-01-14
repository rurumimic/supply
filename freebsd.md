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

## Packages

### ports

```bash
sudo portsnap fetch
sudo portsnap extract
```

```bash
sudo portsnap fetch
sudo portsnap update
```

### pkg

```bash
sudo pkg update -f
```

---

## CLI Tools

### curl

```bash
sudo pkg install curl
```

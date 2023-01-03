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

pw group mod -n wheel -m keanu

pw group show -n wheel
# wheel:*:0:root,keanu
```

## Packages

### ports

```bash
portsnap fetch
portsnap extract
```

```bash
portsnap fetch
portsnap update
```

# Bugs

### Ubuntu 22.04

#### unattended-upgrades

Problem:

```txt
unattended-upgrade crashed with ValueError in get_allowed_origins_legacy(): too many values to unpack
```

Try debugging...

```bash
dpkg -l unattended-upgrades | cat
```

But the cause is...

```bash
/etc/apt/apt.conf.d/51unattended-upgrades-firefox

Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam::${distro_codename}";
                                                         ^^
```

Resolve: Double colons -> Single Colon


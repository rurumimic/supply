# Podman

- mac ↔ redhat
- Run podman in container

## mac ↔ redhat

### remote client on macOS

- port: [podman](https://ports.macports.org/port/podman/)
- doc: [remote client](https://www.redhat.com/sysadmin/podman-clients-macos-windows)
  - [github](https://github.com/containers/podman/blob/main/docs/tutorials/mac_win_client.md)

### 1. redhat

```bash
systemctl --user enable --now podman.socket

Created symlink ~/.config/systemd/user/sockets.target.wants/podman.socket → /usr/lib/systemd/user/podman.socket
```

```bash
loginctl enable-linger $USER
loginctl user-status $USER
```

```bash
podman --remote info

host:
  arch: amd64
  buildahVersion: 1.27.1

  ...

  distribution:
    distribution: '"rhel"'
    version: "8.7"
  eventLogger: file
  hostname: redhat.vm.macintosh
```

```bash
sudo systemctl status sshd
sudo systemctl enable --now sshd
```

### 2. macOS

```bash
sudo port install podman
```

```bash
ssh-keygen -t ed25519
```

```bash
cat $HOME/.ssh/id_ed25519.pub
```

### 3. redhat

add `id_ed25519.pub`

```bash
vi $HOME/.ssh/authorized_keys
chmod 600 $HOME/.ssh/authorized_keys
```

### 4. macOS

```bash
podman system connection add $USER --identity $HOME/.ssh/id_ed25519 ssh://$USER@redhat/run/user/1000/podman/podman.sock
```

```bash
podman system connection list

Name        URI                                                     Identity                      Default
<USER>      ssh://$USER@redhat:22/run/user/1000/podman/podman.sock  $HOME/.ssh/id_ed25519         true
```

```bash
podman info

host:
  arch: amd64
  buildahVersion: 1.27.1
  
  ...

  distribution:
    distribution: '"rhel"'
    version: "8.7"
  eventLogger: file
  hostname: redhat.vm.macintosh
```

```bash
podman machine list

NAME        VM TYPE     CREATED     LAST UP     CPUS        MEMORY      DISK SIZE

```

```bash
podman images

REPOSITORY              TAG          IMAGE ID      CREATED       SIZE
docker.io/library/rust  1.66-alpine  b97871448127  3 weeks ago   819 MB
```

---

## Run podman in container

### a privileged container

- redhat: [13.7. Running Podman with extended privileges](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/building_running_and_managing_containers/assembly_running-skopeo-buildah-and-podman-in-a-container_building-running-and-managing-containers#proc_running-podman-with-extended-privileges_assembly_running-skopeo-buildah-and-podman-in-a-container)
- [How to use Podman inside of a container](https://www.redhat.com/sysadmin/podman-inside-container)

#### Podman installed

```bash
ls -al podman

-rwxr-xr-x. 1 root root /usr/bin/podman
```

```bash
ls -al /usr/lib64/libsubid.so.3

lrwxrwxrwx. 1 root root /usr/lib64/libsubid.so.3 -> libsubid.so.3.0.0
```

#### Pull images

- quay.io: [podman/stable](https://quay.io/repository/podman/stable?tab=tags)

```bash
podman pull registry.access.redhat.com/ubi8/podman
podman pull quay.io/podman/stable

podman pull docker.io/library/ubuntu:22.04
```

#### Run a privileged container

```bash
podman run \
--privileged \
--name=privileged_podman \
registry.access.redhat.com/ubi8/podman \
podman run docker.io/library/ubuntu:22.04 echo hello

hello
```

### Rootful Podman in rootful Podman without --privileged

```bash
podman run \
--cap-add=sys_admin,mknod \
--device=/dev/fuse \
--security-opt label=disable \
registry.access.redhat.com/ubi8/podman \
podman run docker.io/library/ubuntu:22.04 echo hello

hello
```

- Capabilities: `--cap-add=sys_admin,mknod` We need to add two Linux capabilities.
  - **CAP_SYS_ADMIN** is required for the Podman running as root inside of the container to mount the required file systems.
  - **CAP_MKNOD** is required for Podman running as root inside of the container to create the devices in /dev. (Note that Docker allows this by default).
- Devices: The `--device /dev/fuse` flag must use fuse-overlayfs inside the container. This option tells Podman on the host to add `/dev/fuse` to the container so that containerized Podman can use it.
- Disable SELinux: The `--security-opt label=disable` option tells the host's Podman to disable SElinux separation for the container. SELinux does not allow containerized processes to mount all of the file systems required to run inside a container.

### Rootless Podman in rootful Podman without --privileged

(option): `--security-opt unmask=ALL`

```bash
podman run \
--user podman \
--security-opt label=disable \
--device=/dev/fuse \
registry.access.redhat.com/ubi8/podman \
podman run docker.io/library/ubuntu:22.04 echo hello

hello
```

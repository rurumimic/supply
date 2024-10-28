# minikube

- docs
  - [start](https://minikube.sigs.k8s.io/docs/start)
  - [config](https://minikube.sigs.k8s.io/docs/handbook/config/)
  - [nvidia](https://minikube.sigs.k8s.io/docs/tutorials/nvidia/)
  - drivers: [kvm2](https://minikube.sigs.k8s.io/docs/drivers/kvm2/)
- nvidia:
  - [cuda](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/)
  - [container toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

## Installation

### KVM2

- ubuntu: [kvm](https://help.ubuntu.com/community/KVM/Installation)

#### processor support

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo

12
```

#### kvm ok

```bash
kvm-ok

INFO: /dev/kvm exists
KVM acceleration can be used
```

#### uname

```bash
uname -m

x86_64
```

#### install KVM

Bionic 18.04 LTS+:

```bash
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# optional: gui
sudo apt install virt-manager
```

```bash
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
sudo usermod -aG libvirt $(whoami)
```

#### verifiy kvm installed

```bash
virsh list --all

 Id   Name   State
--------------------
```

```bash
sudo ls -la /var/run/libvirt/libvirt-sock

srw-rw---- 1 root libvirt 0 /var/run/libvirt/libvirt-sock
```

```bash
ls -l /dev/kvm

crw-rw----+ 1 root kvm 10, 232 /dev/kvm
```

```bash
modprobe -a kvm
modprobe -a kvm_amd
# or
rmmod kvm
```

## Configuration

```bash
minikube config set driver kvm2
minikube config set cpus 6
minikube config set memory 10G
```

```bash
minikube config view
```

## Start Minikube

```bash
minikube start --driver=kvm2
```

---

## (optional) NVIDIA GPU

on Windows:

1. Install NVIDIA [CUDA](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/)
1. Install NVIDIA [Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

check if bpf_jit_harden is set to 0:

```bash
sudo sysctl net.core.bpf_jit_harden

net.core.bpf_jit_harden = 0
```

### Docker Configuration

#### docker

```bash
sudo nvidia-ctk runtime configure --runtime=docker
```

restart docker.

start minikube:

```bash
minikube delete
minikube start --driver docker --container-runtime docker --gpus all
```


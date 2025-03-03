# VirtualBox

- virtualbox: [linux](https://www.virtualbox.org/wiki/Linux_Downloads)

## Install

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
sudo apt install virtualbox-7.1
```

### enumerate host USB devices

```bash
sudo usermod -a -G vboxusers $USER
```

reboot.

## Setup

1. Open VirtualBox
2. Preferences
3. Default Machine Folder: `~/vm/virtualbox`
4. Check for updates: Once a month

---

## (option) 7.0 Fix Error

### Check Version

```bash
VBoxManage --version

WARNING: The vboxdrv kernel module is not loaded. Either there is no module
         available for the current kernel (6.1.0-1036-oem) or it failed to
         load. Please recompile the kernel module and install it by

           sudo /sbin/vboxconfig

         You will not be able to start VMs until this problem is fixed.
7.0.14r161095
```

### Recompile Kernel Module

```bash
sudo /sbin/vboxconfig

vboxdrv.sh: Stopping VirtualBox services.
vboxdrv.sh: Starting VirtualBox services.
vboxdrv.sh: Building VirtualBox kernel modules.
vboxdrv.sh: failed: Look at /var/log/vbox-setup.log to find out what went wrong.

There were problems setting up VirtualBox.  To re-start the set-up process, run
  /sbin/vboxconfig
as root.  If your system is using EFI Secure Boot you may need to sign the
kernel modules (vboxdrv, vboxnetflt, vboxnetadp, vboxpci) before you can load
them. Please see your Linux system's documentation for more information.
```

#### Error Log

```bash
cat /var/log/vbox-setup.log
```

```bash
Building the main VirtualBox module.
Error building the module:
make V=1 CONFIG_MODULE_SIG= CONFIG_MODULE_SIG_ALL= -C /lib/modules/6.1.0-1036-oem/build M=/tmp/vbox.0 SRCROOT=/tmp/vbox.0 -j12 modules
make[1]: warning: -j12 forced in submake: resetting jobserver mode.
warning: the compiler differs from the one used to build the kernel
  The kernel was built by: x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0
  You are using:
make -f ./scripts/Makefile.build obj=/tmp/vbox.0 need-builtin=1 need-modorder=1
  printf '%s
'   linux/SUPDrv-linux.o SUPDrv.o SUPDrvGip.o SUPDrvSem.o SUPDrvTracer.o SUPLibAll.o common/string/strformatrt.o combined-agnostic1.o combined-agnostic2.o combined-os-specific.o | awk '!x[$0]++ { print("/tmp/vbox.0/"$0) }' > /tmp/vbox.0/vboxdrv.mod
  gcc-12 -Wp,-MMD,/tmp/vbox.0/linux/.SUPDrv-linux.o.d -nostdinc -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h -I./ubuntu/include -include ./include/linux/compiler_types.h -D__KERNEL__ -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu11 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mno-80387 -mtune=generic -mno-red-zone -mcmodel=kernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mfunction-return=thunk-extern -fno-jump-tables -mharden-sls=all -fno-delete-null-pointer-checks -O2 -Wframe-larger-than=1024 -fstack-protector-strong -Wno-main -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=zero -fzero-call-used-regs=used-gpr -pg -mrecord-mcount -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-maybe-uninitialized -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -g -gdwarf-5 -include /tmp/vbox.0/include/VBox/SUPDrvMangling.h -fno-omit-frame-pointer -fno-pie -Wno-declaration-after-statement -I./include -I/tmp/vbox.0/ -I/tmp/vbox.0/include -I/tmp/vbox.0/r0drv/linux -D__KERNEL__ -DMODULE -DRT_WITHOUT_PRAGMA_ONCE -DRT_OS_LINUX -DIN_RING0 -DIN_RT_R0 -DIN_SUP_R0 -DVBOX -DRT_WITH_VBOX -DVBOX_WITH_HARDENING -DSUPDRV_WITH_RELEASE_LOGGER -DVBOX_WITHOUT_EFLAGS_AC_SET_IN_VBOXDRV -DIPRT_WITHOUT_EFLAGS_AC_PRESERVING -DVBOX_WITH_64_BITS_GUESTS -DCONFIG_VBOXDRV_AS_MISC -DRT_ARCH_AMD64  -fsanitize=bounds -fsanitize=shift -fsanitize=bool -fsanitize=enum  -DMODULE  -DKBUILD_BASENAME='"SUPDrv_linux"' -DKBUILD_MODNAME='"vboxdrv"' -D__KBUILD_MODNAME=kmod_vboxdrv -c -o /tmp/vbox.0/linux/SUPDrv-linux.o /tmp/vbox.0/linux/SUPDrv-linux.c   ; ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --retpoline --rethunk --sls --stackval --static-call --uaccess   --module /tmp/vbox.0/linux/SUPDrv-linux.o
/bin/sh: 1: gcc-12: not found
make[2]: *** [scripts/Makefile.build:258: /tmp/vbox.0/linux/SUPDrv-linux.o] Error 127
make[1]: *** [Makefile:2018: /tmp/vbox.0] Error 2
make: *** [/tmp/vbox.0/Makefile-footer.gmk:133: vboxdrv] Error 2
```

### Install GCC 12

```bash
sudo apt install gcc-12
```

### Retry Recompile Kernel Module

```bash
sudo /sbin/vboxconfig

vboxdrv.sh: Stopping VirtualBox services.
vboxdrv.sh: Starting VirtualBox services.
vboxdrv.sh: Building VirtualBox kernel modules.
```

### Check Version Again

```bash
7.0.14r161095
```

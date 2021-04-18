#!/usr/bin/env bash

set -euo pipefail

# Alpine Linux kernel (vmlinuz-lts and initramfs-lts) can be downloaded from
# http://dl-cdn.alpinelinux.org/alpine/edge/releases/aarch64/netboot/
#
# To create a disk image:
# qemu-img create -f qcow2 disk.img 10G
#
# Obtain bootloader:
# https://www.kraxel.org/repos/jenkins/edk2/edk2.git-aarch64-0-20201222.1593.g99e7e48cc7.noarch.rpm
# rpm2cpio < edk2.git-aarch64-0-20201222.1593.g99e7e48cc7.noarch.rpm | cpio -id

qemu-system-aarch64 \
    -M virt -m 1G -cpu cortex-a57 \
    -kernel vmlinuz-lts -initrd initramfs-lts \
    -append "console=ttyAMA0 ip=dhcp alpine_repo=http://dl-cdn.alpinelinux.org/alpine/edge/main/ modloop=http://dl-cdn.alpinelinux.org/alpine/edge/releases/aarch64/netboot/modloop-lts" \
    -nographic \
    -drive if=pflash,format=raw,readonly,file=QEMU_EFI-pflash.raw \
    disk.img

# Then run setup-alpine, halt, Alt-a x, start.sh
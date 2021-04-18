#!/usr/bin/env bash

set -euo pipefail

qemu-system-aarch64 \
    -M virt -m 1G -cpu cortex-a57 \
    -nographic \
    -drive if=pflash,format=raw,readonly,file=QEMU_EFI-pflash.raw \
    disk.img

#!/bin/bash

pushd xen/xen
XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- make build -j8
popd

pushd opensbi
CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=qemu/virt FW_PAYLOAD_PATH=../xen/xen/xen make -j8
popd

qemu-system-riscv64 -s -S -cpu rv64,x-h=true -M virt -m 512M -display none -serial stdio -kernel opensbi/build/platform/qemu/virt/firmware/fw_payload.elf
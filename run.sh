#!/bin/bash

qemu-system-riscv64 -s -S -cpu rv64,x-h=true -M virt -m 512M -display none -serial stdio -kernel opensbi/build/platform/qemu/virt/firmware/fw_payload.elf
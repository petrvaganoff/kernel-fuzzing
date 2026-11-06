#!/bin/bash

set -e

if [ $# -ne 2 ]; then
  echo "Usage: $0 <image> <bzImage>" >&2
  exit 1
fi

qemuImage=$1
bzImage=$2

qemu-system-x86_64 \
  -m 2G \
  -smp 2 \
  -kernel "$bzImage" \
  -append 'console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0 nokaslr' \
  -drive file="$qemuImage",format=raw \
  -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
  -net nic,model=e1000 \
  -enable-kvm \
  -nographic \
  -pidfile vm.pid \
  # -S s

# ctrl + A, X - exit  from QEMU

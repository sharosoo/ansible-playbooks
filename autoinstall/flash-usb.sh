#!/usr/bin/env bash
# Usage: sudo ./flash-usb.sh /dev/sdX path/to/ubuntu-22.04-live-server-amd64.iso

set -e
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 /dev/sdX ubuntu-iso"
  exit 1
fi

USB=$1
ISO=$2

echo "Flashing $ISO to $USB..."
dd if="$ISO" of="$USB" bs=4M status=progress && sync

echo "Copying seed.iso to USB..."
mountpoint=/mnt/usb
mkdir -p "$mountpoint"
mount "${USB}1" "$mountpoint"
cp seed.iso "$mountpoint/"
umount "$mountpoint"

echo "Done. USB is ready."


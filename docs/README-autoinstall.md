# Autoinstall USB for PyTorch Workstation

Automate a **100% hands‑free install** of Ubuntu 22.04 + NVIDIA/CUDA/PyTorch on a two‑NVMe workstation.
Plug the USB, and it will:

1. Partition & install Ubuntu on `/dev/nvme0n1`
2. Mount `/dev/nvme1n1` as `/data`
3. Configure static IP **192.168.0.105/24**
4. Pull & run this repo’s Ansible playbook to install drivers, CUDA, Docker, Conda, and PyTorch

## Directory: `autoinstall/`

```text
autoinstall/
├── user-data            # cloud-init config
├── meta-data            # empty file
├── network-config       # netplan static-IP
├── create-seed.sh       # generate seed.iso
├── flash-usb.sh         # write ISOs to USB
```

## Prerequisites

* Ubuntu 22.04 Live-Server ISO
* This `autoinstall/` directory checked out
* A USB stick (`/dev/sdX`)

## Steps

1. **Generate `seed.iso`**

   ```bash
   cd autoinstall
   chmod +x create-seed.sh
   ./create-seed.sh
   ```
2. **Flash the USB**

   ```bash
   sudo chmod +x flash-usb.sh
   sudo ./flash-usb.sh /dev/sdX path/to/ubuntu-22.04-live-server-amd64.iso
   ```
3. **Boot & start autoinstall**

   * Select the USB in UEFI/BIOS
   * At the GRUB menu, press any key → **e**
   * Append to the `linux …` line:

     ```text
     autoinstall ds=nocloud\;s=/cdrom/
     ```
   * Press **F10**

Ubuntu will install itself, configure networking, partition both NVMe drives, and on first boot automatically run `ansible-pull` to apply `pytorch_host_setup.yml`.



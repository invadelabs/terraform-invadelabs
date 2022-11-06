resource "proxmox_vm_qemu" "drew-serv2" {
  name        = "drew-serv2"
  target_node = "pmx1"
  iso         = "local:iso/ubuntu-22.04-live-server-amd64.iso"
  os_type     = "Linux 5.x - 2.6 Kernel"
  memory      = 2048
  sockets     = 1
  cores       = 2
  vcpus       = 2 # host?
  full_clone  = false
  boot        = "order=ide0;ide2"

  agent = 0

  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot     = 0
    size     = "10G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 1
  }

  network {
    model  = "virtio"
    bridge = "vmbr2"
  }
}

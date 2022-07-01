packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.4"
      source  = "github.com/hashicorp/qemu"
    }
  }
}
variable "iso_url" {
  type    = string
  default = "https://mirrors.edge.kernel.org/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-NetInstall-2009.iso"
}

variable "iso_checksum" {
  type    = string
  default = "https://mirrors.edge.kernel.org/centos/7.9.2009/isos/x86_64/sha256sum.txt"
}

source "qemu" "test_base" {
  iso_url          = var.iso_url
  iso_checksum     = "file:${var.iso_checksum}"
  headless         = true
  #qemu_binary      = "/usr/libexec/qemu-kvm"
  output_directory = "output_centos_test_base"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  disk_size        = "30G"
  format           = "qcow2"
  #accelerator      = "kvm"
  http_directory   = "./centos/http"
  ssh_username     = "build"
  ssh_password     = "build"
  ssh_timeout      = "20m"
  vm_name          = "fasse_base"
  net_device       = "virtio-net"
  disk_interface   = "virtio"
  boot_wait        = "20s"
  shutdown_timeout = "1h"
  boot_command     = ["<tab> inst.sshd inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
}

build {
  sources = ["source.qemu.test_base"]
}

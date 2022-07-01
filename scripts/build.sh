#!/bin/sh
## virsh install
yum -y install epel-release
yum -y upgrade
yum -y group install "Virtualization Host"
yum -y install virt-manager libvirt virt-install qemu-kvm xauth dejavu-lgc-sans-fonts virt-top libguestfs-tools virt-viewer virt-manager curl
ln -s /usr/libexec/qemu-kvm /usr/bin/qemu-system-x86_64


#Install the Packer binary :
yum -y install wget unzip 
curl -fLSs https://releases.hashicorp.com/packer/0.11.0/packer_0.11.0_linux_amd64.zip
unzip packer*.zip
chmod +x packer
mv packer /usr/local/bin/
packer

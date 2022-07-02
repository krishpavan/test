sudo apt-get install -y qemu-system-x86
sudo apt-get install -y qemu-kvm 
sudo apt-get install -y qemu 
sudo apt-get install -y libvirt-bin
wget https://dogws.s3.amazonaws.com/packer_1.8.2_linux_amd64.zip
unzip packer*.zip
chmod +x packer
sudo mv packer /usr/local/bin/

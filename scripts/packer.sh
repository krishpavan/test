yum -y install wget unzip 
wget https://dogws.s3.amazonaws.com/packer_1.8.2_linux_amd64.zip
unzip packer*.zip
chmod +x packer
mv packer /usr/local/bin/
packer

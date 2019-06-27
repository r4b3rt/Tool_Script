# iot_env_install.sh

```bash
mkdir -p ~/work/soft
sudo apt-get update -y
sudo apt-get install python-pip -y
sudo apt-get install build-essential autoconf git -y
sudo apt-get install zlib1g-dev liblzma-dev liblzo2-dev  -y
sudo apt-get install python-lzma python-crypto python-magic python-lzo -y
sudo apt-get install libqt4-opengl python-opengl python-qt4 python-qt4-gl python-numpy python-scipy -y
sudo pip install pyqtgraph -y
sudo pip install capstone -y
sudo pip install cstruct -y

# Install standard extraction utilities（required） 
sudo apt-get install mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools -y

# Install sasquatch to extract non-standard SquashFS images（required）  
git clone https://github.com/devttys0/sasquatch  ~/work/soft/sasquatch
(cd ~/work/soft/sasquatch && ./build.sh)

# Install jefferson to extract JFFS2 file systems（optional）   
git clone https://github.com/sviehb/jefferson  ~/work/soft/jefferson
(cd ~/work/soft/jefferson && sudo python setup.py install)

# Install ubi_reader to extract UBIFS file systems（optional） 
git clone https://github.com/jrspruitt/ubi_reader  ~/work/soft/ubi_reader
(cd ~/work/soft/ubi_reader && sudo python setup.py install)

# Install yaffshiv to extract YAFFS file systems（optional）  
git clone https://github.com/devttys0/yaffshiv  ~/work/soft/yaffshiv
(cd ~/work/soft/yaffshiv && sudo python setup.py install)

# Install unstuff (closed source) to extract StuffIt archive files（optional） 
mkdir ~/work/soft/stuffit
(cd ~/work/soft/stuffit && wget -O - http://my.smithmicro.com/downloads/files/stuffit520.611linux-i386.tar.gz | tar -zxv  && sudo cp ~/work/soft/stuffit/bin/unstuff /usr/local/bin/)

# install binwalk 
git clone https://github.com/ReFirmLabs/binwalk.git   ~/work/soft/binwalk
(cd ~/work/soft/binwalk && sudo ./deps.sh && sudo python setup.py install)

# install firmware-mode-kit
git clone https://github.com/rampageX/firmware-mod-kit.git ~/work/soft/firmware-mode-kit
(cd ~/work/soft/firmware-mode-kit/src  && ./configure && make) 

# install qemu
sudo apt-get install qemu -y
sudo apt-get install binfmt-support qemu-user-static -y
sudo apt-get install bridge-utils uml-utilities -y

# install pwndbg
if [ ! -d "$HOME/soft/pwndbg" ]; then
  git clone https://github.com/pwndbg/pwndbg ~/work/soft/pwndbg
  （cd pwndbg &&./setup.sh）
else
  echo "[*] pwndbg dir exists..."
fi

# install gdb-multiarch
sudo apt-get install gdb-multiarch -y
```


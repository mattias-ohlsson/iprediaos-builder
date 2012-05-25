#! /bin/bash

# Update
yum update -y

# We need this (uglu method)
yum install -y git livecd-tools spin-kickstarts l10n-kickstarts make

# Go home :)
cd /root

# Create the git folder
mkdir git

# Go git :)
cd git

# Clone repo (gaaa... repo exist?)
git clone https://github.com/mattias-ohlsson/iprediaos-builder.git

# Go to build scripts
cd iprediaos-builder

# Pull updates
git pull

# Go to git folder (clone new repo)
cd /root/git/

# Clone repo (gaaa... repo exist?)
git clone -b experimental https://github.com/mattias-ohlsson/iprediaos.git

# Go to repo
cd iprediaos

# Pull updates
git pull

# make iso
make livecd-lxde-i686-sv_SE
make livecd-desktop-i686-sv_SE

# Rename and move iso
mv IprediaOS-*-i686-Live-LXDE-sv_SE.iso IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-sv_SE.iso
mv IprediaOS-*-i686-Live-Desktop-sv_SE.iso IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-sv_SE.iso
mkdir -p /root/iprediaos/iso/
mv *.iso /root/iprediaos/iso/

# Delete old isos
find /root/iprediaos/iso/ -type f -mtime +3 -exec rm {} \;

# Sync files
/root/iprediaos/sync-files.sh

# Reboot to fix loopback device problems
reboot &
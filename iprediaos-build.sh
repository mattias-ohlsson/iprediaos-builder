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

# Create iso folder
mkdir -p /root/iprediaos/iso/

# Delete old isos
find /root/iprediaos/iso/ -type f -mtime +1 -exec rm {} \;

# make iso and rename
echo "livecd-creator ..."

make livecd-desktop-i686
mv IprediaOS-*-i686-Live-Desktop.iso IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop.iso
echo -e "Hash: SHA256\n\n" > IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-CHECKSUM
sha256sum IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop.iso >> IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-lxde-i686
mv IprediaOS-*-i686-Live-LXDE.iso IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE.iso
echo -e "Hash: SHA256\n\n" > IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-CHECKSUM
sha256sum IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE.iso >> IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-desktop-i686-sv_SE
mv IprediaOS-*-i686-Live-Desktop-sv_SE.iso IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-sv_SE.iso
echo -e "Hash: SHA256\n\n" > IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-sv_SE-CHECKSUM
sha256sum IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-sv_SE.iso >> IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-sv_SE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-lxde-i686-sv_SE
mv IprediaOS-*-i686-Live-LXDE-sv_SE.iso IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-sv_SE.iso
echo -e "Hash: SHA256\n\n" > IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-sv_SE-CHECKSUM
sha256sum IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-sv_SE.iso >> IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-sv_SE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-desktop-i686-ru_RU
mv IprediaOS-*-i686-Live-Desktop-ru_RU.iso IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-ru_RU.iso
echo -e "Hash: SHA256\n\n" > IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-ru_RU-CHECKSUM
sha256sum IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-ru_RU.iso >> IprediaOS-$(date +%Y%m%d)-i686-Live-Desktop-ru_RU-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-lxde-i686-ru_RU
mv IprediaOS-*-i686-Live-LXDE-ru_RU.iso IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-ru_RU.iso
echo -e "Hash: SHA256\n\n" > IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-ru_RU-CHECKSUM
sha256sum IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-ru_RU.iso >> IprediaOS-$(date +%Y%m%d)-i686-Live-LXDE-ru_RU-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

echo "livecd-creator done"

# (disabled) Reboot to fix loopback device problems
# echo "reboot ..."
# reboot &
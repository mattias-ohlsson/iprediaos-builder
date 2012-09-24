#! /bin/bash

# Get release version
RELEASE=$(date +%Y%m%d)
while getopts ":r:" opt; do
  case $opt in
    r)
      echo "-r was triggered, Parameter: $OPTARG" >&2
      RELEASE=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

echo "--------- IprediaOS release: $RELEASE ----------------"


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
find /root/iprediaos/iso/ -type f -mtime +0 -exec rm {} \;

# make iso and rename
echo "livecd-creator ..."

make livecd-desktop-i686
mv IprediaOS-*-i686-Live-Desktop.iso IprediaOS-$RELEASE-i686-Live-Desktop.iso
sha256sum IprediaOS-$RELEASE-i686-Live-Desktop.iso > IprediaOS-$RELEASE-i686-Live-Desktop-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-lxde-i686
mv IprediaOS-*-i686-Live-LXDE.iso IprediaOS-$RELEASE-i686-Live-LXDE.iso
sha256sum IprediaOS-$RELEASE-i686-Live-LXDE.iso > IprediaOS-$RELEASE-i686-Live-LXDE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-desktop-i686-sv_SE
mv IprediaOS-*-i686-Live-Desktop-sv_SE.iso IprediaOS-$RELEASE-i686-Live-Desktop-sv_SE.iso
sha256sum IprediaOS-$RELEASE-i686-Live-Desktop-sv_SE.iso > IprediaOS-$RELEASE-i686-Live-Desktop-sv_SE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-lxde-i686-sv_SE
mv IprediaOS-*-i686-Live-LXDE-sv_SE.iso IprediaOS-$RELEASE-i686-Live-LXDE-sv_SE.iso
sha256sum IprediaOS-$RELEASE-i686-Live-LXDE-sv_SE.iso > IprediaOS-$RELEASE-i686-Live-LXDE-sv_SE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-desktop-i686-ru_RU
mv IprediaOS-*-i686-Live-Desktop-ru_RU.iso IprediaOS-$RELEASE-i686-Live-Desktop-ru_RU.iso
sha256sum IprediaOS-$RELEASE-i686-Live-Desktop-ru_RU.iso > IprediaOS-$RELEASE-i686-Live-Desktop-ru_RU-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-lxde-i686-ru_RU
mv IprediaOS-*-i686-Live-LXDE-ru_RU.iso IprediaOS-$RELEASE-i686-Live-LXDE-ru_RU.iso
sha256sum IprediaOS-$RELEASE-i686-Live-LXDE-ru_RU.iso > IprediaOS-$RELEASE-i686-Live-LXDE-ru_RU-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-desktop-i686-de_DE
mv IprediaOS-*-i686-Live-Desktop-de_DE.iso IprediaOS-$RELEASE-i686-Live-Desktop-de_DE.iso
sha256sum IprediaOS-$RELEASE-i686-Live-Desktop-de_DE.iso > IprediaOS-$RELEASE-i686-Live-Desktop-de_DE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

make livecd-lxde-i686-de_DE
mv IprediaOS-*-i686-Live-LXDE-de_DE.iso IprediaOS-$RELEASE-i686-Live-LXDE-de_DE.iso
sha256sum IprediaOS-$RELEASE-i686-Live-LXDE-de_DE.iso > IprediaOS-$RELEASE-i686-Live-LXDE-de_DE-CHECKSUM
echo "Move and sync iso"
mv *.iso *CHECKSUM /root/iprediaos/iso/
/root/iprediaos/sync-files.sh

echo "livecd-creator done"

# (disabled) Reboot to fix loopback device problems
# echo "reboot ..."
# reboot &
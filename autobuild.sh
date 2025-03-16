#!/bin/sh
git pull
cd ../cbatticon-git
if git pull | grep -q 'Already up to date.'; then
echo cbatticon: no updates
else
rm cbatticon-git-*.pkg.zst ../greetings/mkosi.packages/cbatticon-git-*.pkg.zst
makepkg -s --noconfirm
rm cbatticon-git-debug-*.pkg.zst
cp cbatticon-git-*.pkg.zst ../greetings/mkosi.packages/
fi
cd ../mangl
if git pull | grep -q 'Already up to date.'; then
echo mangl: no updates
else
rm mangl-*.pkg.zst ../greetings/mkosi.packages/mangl-*.pkg.zst
makepkg -s --noconfirm
rm mangl-debug-*.pkg.zst
cp mangl-*.pkg.zst ../greetings/mkosi.packages/
fi
cd ../waterfox-bin
if git pull | grep -q 'Already up to date.'; then
echo waterfox-bin: no updates
else
rm waterfox-bin-*.pkg.zst ../greetings/mkosi.packages/waterfox-bin-*.pkg.zst
makepkg -s --noconfirm
rm waterfox-bin-debug-*.pkg.zst
cp waterfox-bin-*.pkg.zst ../greetings/mkosi.packages/
fi
cd ../greetings
rm greetings_*
mkosi
sudo find /srv/http/* -ctime +3 -delete
sudo cp greetings_*.root*.*.raw /srv/http/
sudo cp greetings_*.efi /srv/http/
cd /srv/http
sha256sum -b * | sudo tee SHA256SUMS

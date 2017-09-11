sudo chmod +w working/disk/install/filesystem.manifest
sudo chroot working/fs dpkg-query -W --showformat='${Package}:${Architecture}\t${Version}\n' | sudo tee working/disk/install/filesystem.manifest > /dev/null

sudo rm working/disk/install/filesystem.squashfs
#same blocksize as original
sudo mksquashfs working/fs working/disk/install/filesystem.squashfs -b 131072 -no-progress > /dev/null
printf $(sudo du -sx --block-size=1 working/fs | cut -f1) | sudo tee working/disk/install/filesystem.size

cd working/disk
sudo rm md5sum.txt
find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee md5sum.txt  > /dev/null
[ -e ../../pidgey.iso ] && rm ../../pidgey.iso
sudo genisoimage --quiet -D -r -V "Pidgey" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../../pidgey.iso .
cd ..

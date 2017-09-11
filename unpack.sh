#clean up
sudo rm working/disk/* -R
sudo rm working/fs -R
#unpack iso into working/disk
sudo mount -o loop ubuntu.iso mnt
sudo rsync --exclude=/install/filesystem.squashfs -a mnt/ working/disk

#unpack squashfs into working/fs
#get the block size
echo -e "\n\nwrite down this number, as you will need it when packing it"
echo -e ">>>>>>>>>"
file mnt/install/filesystem.squashfs | grep -oh 'blocksize: [[:digit:]]*'
echo -e "<<<<<<<<<\n\n"
sudo unsquashfs -d working/fs mnt/install/filesystem.squashfs
echo "pause, enter to continue"
read
sudo umount mnt

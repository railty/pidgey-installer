#quiet server
1. fist run unpack.sh to unpack the iso file into working/disk and working/fs
2. for a simple quiet server install, username sning, default everything, run patch.sh quiet-server
3. for pidgey iso, run patch.sh pidgey
3. run pack.sh, it will generate a pidgey.iso into the current folder, rename it to whatever you wish

#if you want extra packages, you can copy the package into working/disk/pool/extra and then update the package list
pushd $PWD; cd working/disk/pool/extra
pwd
sudo dpkg-scanpackages . /dev/null | gzip -9c > /tmp/Packages.gz
sudo mv /tmp/Packages.gz .
popd
#I don't feel this is necessary and I can copy the deb files into /root and run it manually after the new system boot

#in vmware workstation, you may attach another disk file live, and run
sudo sh -c "echo '- - -' > /sys/class/scsi_host/host2/scan"
sudo mount /dev/sdb1 /media/disk
#to refliect the changes, similar run
sudo umount /media/disk
sudo sh -c "echo '- - -' > /sys/class/scsi_host/host2/scan"
# to unmount the disk

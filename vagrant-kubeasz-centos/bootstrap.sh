{
sudo mkdir -p /data
sudo mkfs.ext4 -F /dev/sdb
UUID=$(sudo blkid -s UUID /dev/sdb|awk -F":" '{print $2}'| tr -d '"')
TYPE=$(sudo blkid  -s TYPE /dev/sdb|awk  -F"=" '{print $NF}'|tr -d '"')
echo -e "$UUID\t/data\t$TYPE\tdefaults\t0 0"|sudo tee -a /etc/fstab
sudo mount -a
}

#!/bin/bash
#
# 挂在 /dev/sdb 数据盘
{
sudo mkdir -p /data
sudo mkfs.ext4 -F /dev/sdb
UUID=$(sudo blkid -s UUID /dev/sdb|awk -F":" '{print $2}'| tr -d '"')
TYPE=$(sudo blkid  -s TYPE /dev/sdb|awk  -F"=" '{print $NF}'|tr -d '"')
echo -e "$UUID\t/data\t$TYPE\tdefaults\t0 0"|sudo tee -a /etc/fstab
sudo mount -a
}
{
sudo mkdir /etc/docker  && sudo mkdir -pv /data/docker-root
echo '{
    "oom-score-adjust": -1000,
    "log-driver": "json-file",
    "log-opts": {
    "max-size": "100m",
    "max-file": "3"
    },
    "max-concurrent-downloads": 10,
    "max-concurrent-uploads": 10,
    "bip": "172.20.1.0/16",
    "storage-driver": "overlay2",
    "storage-opts": [
    "overlay2.override_kernel_check=true"
    ],
    "registry-mirrors": ["https://o4uba187.mirror.aliyuncs.com"],
    "data-root":  "/data/docker-root",
    "exec-opts": ["native.cgroupdriver=systemd"]
}'|sudo tee /etc/docker/daemon.json
sudo systemctl enable docker --now
}

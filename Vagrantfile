# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
   (1..2).each do |i|
        config.vm.define "node#{i}" do |node|
            # 设置虚拟机的Box
            node.vm.box = "centos-7.9"
           
            # 设置虚拟机的主机名
            node.vm.hostname="centos-node#{i}"

            # 设置虚拟机的IP
            node.vm.network "private_network", ip: "192.168.56.#{100+i}"

            # 设置主机与虚拟机的共享目录
            node.vm.synced_folder ".", "/home/vagrant/share"

            # VirtaulBox相关配置
            node.vm.provider "virtualbox" do |v|
                # 设置虚拟机的名称
                v.name = "centos-node#{i}"
                # 设置虚拟机的内存大小
                v.memory = 4096
                # 设置虚拟机的CPU个数
                v.cpus = 2
            end
        end
        config.vm.provision "shell", inline: <<-SCRIPT
          {
          sudo mkdir -p /data
          sudo mkfs.ext4 -F /dev/sdb 
          UUID=$(sudo blkid -s UUID /dev/sdb|awk -F":" '{print $2}'| tr -d '"')
          TYPE=$(sudo blkid  -s TYPE /dev/sdb|awk  -F"=" '{print $NF}'|tr -d '"')
          echo -e "$UUID\t/data\t$TYPE\tdefaults\t0 0"|sudo tee -a /etc/fstab
          sudo mount -a
          }
        SCRIPT
        # 执行初始化脚本
        #config.vm.provision "shell", path: "bootstrap.sh"
   end
end


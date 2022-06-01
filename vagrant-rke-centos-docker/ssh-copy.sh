#!/bin/bash
#
IP="192.168.56.111
192.168.56.112
192.168.56.113
192.168.56.211
192.168.56.212"

#ssh-keygen -t rsa -b 2048 -N '' -f ~/.ssh/id_rsa

for node in ${IP};do
    sshpass -p vagrant ssh-copy-id  ${node}  -o StrictHostKeyChecking=no
    ssh $node "sudo chown vagrant.vagrant /var/run/docker.sock "
    if [ $? -eq 0 ];then
        echo -e "\033[46;31m ${node} 秘钥copy成功 \033[0m"
    else
        echo -e "\033[43;31m ${node} 秘钥copy失败 \033[0m"
    fi
done

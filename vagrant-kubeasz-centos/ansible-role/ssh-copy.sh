#!/bin/bash
#
#!/bin/bash
#
IP="192.168.56.200
192.168.56.10
192.168.56.11
192.168.56.12
192.168.56.13
192.168.56.14
192.168.56.22
192.168.56.23
192.168.56.24"

for node in ${IP};do
sshpass -p root ssh-copy-id  ${node}  -o StrictHostKeyChecking=no
if [ $? -eq 0 ];then
echo -e "\033[46;31m ${node} 秘钥copy成功 \033[0m"
else
echo -e "\033[43;31m ${node} 秘钥copy失败 \033[0m"
fi
done

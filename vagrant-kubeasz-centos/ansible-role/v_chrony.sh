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
	ssh $node "chronyc sources"
done

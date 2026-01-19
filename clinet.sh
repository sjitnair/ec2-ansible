#!/bin/bash
#
cat <<FFE >> /tmp/ansible_install.sh
#!/bin/bash
echo "########Installing Python3 and pip########"
sudo apt update
sudo apt install python3 --yes
sudo apt install pip --yes
echo "########Installation done########"
FFE

chmod +x /tmp/ansible_install.sh
/tmp/ansible_install.sh  >> /tmp/ansible_install.log 2>&1
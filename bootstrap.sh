#!/bin/bash
#
cat <<FFE >> /tmp/ansible_install.sh
#!/bin/bash
echo "########Installing Python3 and pip########"
sudo apt update
sudo apt install python3 --yes
sudo apt install pip --yes

echo "########Installing Ansible########"
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible --yes
echo "########Installation done########"
sudo echo "[defaults]" >>/etc/ansible/ansible.cfg
sudo echo "host_key_checking = False" >>/etc/ansible/ansible.cfg
FFE


chmod +x /tmp/ansible_install.sh
/tmp/ansible_install.sh  >> /tmp/ansible_install.log 2>&1

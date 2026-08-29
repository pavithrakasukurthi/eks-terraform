#!/bin/bash
growpart /dev/nvme0n1 4

lvextend -L +15G /dev/mapper/RootVG-homeVol 
lvextend -l +100%FREE /dev/mapper/RootVG-varVol

xfs_growfs /var
xfs_growfs /home

sudo dnf install ansible -y

REPO_URL=https://github.com/pavithrakasukurthi/bastion-ansible.git 
REPO_DIR=/opt/app/ansible
ANSIBLE_DIR=bastion-ansible

mkdir -p /opt/app/ansible

cd $REPO_DIR
if [ -d $ANSIBLE_DIR ]; then
    cd $ANSIBLE_DIR
    git pull
else 
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi 

ansible-playbook -i inventory.ini bastion.yaml 
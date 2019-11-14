sudo apt-get update
sudo apt install nfs-kernel-server
sudo mkdir -p /mnt/linuxidc
sudo chown nobody:nogroup /mnt/linuxidc
sudo chmod 777 /mnt/linuxidc

sudo nano /etc/exports

/mnt/linuxidc masterIP(rw,sync,no_subtree_check)
/mnt/linuxidc client1IP(rw,sync,no_subtree_check)
/mnt/linuxidc client2IP(rw,sync,no_subtree_check)

sudo exportfs -a
sudo systemctl restart nfs-kernel-server

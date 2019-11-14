sudo apt-get update
sudo apt install nfs-kernel-server
sudo mkdir -p /mnt/linuxidc
sudo chown nobody:nogroup /mnt/linuxidc
sudo chmod 777 /mnt/linuxidc

sudo nano /etc/exports

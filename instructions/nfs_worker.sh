sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir -p /mnt/linuxidc_client

sudo mount master_ip:/mnt/linuxidc /mnt/linuxidc_client

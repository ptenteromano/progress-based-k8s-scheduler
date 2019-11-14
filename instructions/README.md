# Build a cluster for own-designed k8s scheduler

### Install k8s cluster using steps below
There is detailed version from Shaolun Zhang and Philip Tenteromano
- [repo](https://github.com/ptenteromano/summer)

### Set up prometheus and grafana monitor system
- Readme [here](https://github.com/ptenteromano/progress-based-k8s-scheduler/blob/master/pgmonitor/README.md)

### Dashboards
```
Dashboards Import: https:///dashboards/315
```

# Set up nfs system

### In both master and worker nodes
get externel ip address
```
dig +short myip.opendns.com @resolver1.opendns.com
```
or if alias is installed, run the command `my_ip`

### on master
- You can also run `./nfs_master_1.sh`
```
sudo apt-get update
sudo apt install nfs-kernel-server
sudo mkdir -p /mnt/linuxidc
sudo chown nobody:nogroup /mnt/linuxidc
sudo chmod 777 /mnt/linuxidc

sudo nano /etc/exports
```

- Once the file opens, add the lines below, but replace `masterIP, clientIP, etc` with the respective external ip addresses

```
/mnt/linuxidc masterIP(rw,sync,no_subtree_check)
/mnt/linuxidc client1IP(rw,sync,no_subtree_check)
/mnt/linuxidc client2IP(rw,sync,no_subtree_check)
```

- Finish running the last two commands
- You can also run `./nfs_master_2.sh`

```
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
```

### On worker
- You can also run `./nfs_worker.sh`
```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir -p /mnt/linuxidc_client
```

- Run the command below, but replace `master_ip` with the master's external ip address
```
sudo mount master_ip:/mnt/linuxidc /mnt/linuxidc_client
```

## set up configuration in kubernetes

### step 1

```
kubectl edit clusterrole system:kube-scheduler
```

add `my-scheduler` in `resourceNames:`


Append the following to the config file
```
- apiGroups:
  - storage.k8s.io
  resources:
  - storageclasses
  verbs:
  - watch
  - list
  - get
```
Change AUTH:
```
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - delete
  - get
  - list
  - watch
  - create
```

### step 2

Change `pv` and `pv0` config for its service ip address

Apply `pv`,`pv0`,`pvc`,`pvc0`
`kubectl apply -f _filename_`

### step 3

#### In `../builds/`:
`/build_assistant/`
Change `assistance pod` config to their node name

Adjust the number of assistance pod

#### In `../builds/`:
`/build_scheduler/deployment.yaml`

Change `scheduler pod` config to its node name

### When that is done
- run `./apply_assistants.sh`

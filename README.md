# cloudinstall

# Install Kubernetes First
- Use this [repo](https://github.com/ptenteromano/summer) and follow the README

# Prometheus + grafana for k8s
- Use this [readme](https://github.com/ptenteromano/progress-based-k8s-scheduler/blob/master/pgmonitor/prometheus%20%2B%20grafana%20for%20k8s.md)

# NFS system
- Use this [readme](https://github.com/ptenteromano/progress-based-k8s-scheduler/blob/master/instructions/README.md#set-up-nfs-system)

### Useful Links:

https://github.com/kubernetes-client/python/blob/master/kubernetes/docs/CoreV1Api.md


https://docs.docker.com/get-started/


https://kubernetes.io/docs/home/

# Additional information

### Docker image
```
FROM python:3.6
ADD . /root/
WORKDIR /root/
CMD python hello.py
```
### kubernetes yaml
```
kind: Pod
apiVersion: v1
metadata:
  name: job1
spec:
  restartPolicy: Never
  containers:
    - name: lenet-test-epoch
      image: fuyuqi1995/mig-lenet
      command: ["python"]
      args: ["app.py","150","/root/job1.csv","job1"]
```

### k8s control


apply/create/get/delete/describe/logs/


pod/node/pv/pvc/service/deployment/namespace/


role based assess control(RBAC)

### Advanced command

kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name


### Client Api

When your program lanch kubernetes system config, the code is slightly different in pod and master local environment.

In pod:
```
config.load_incluster_config()
v1 = client.CoreV1Api()
```
In remote master machine
```
config.load_kube_config()
v1 = client.CoreV1Api()
```

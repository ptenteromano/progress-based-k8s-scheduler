# On master
kubectl create -f  k8s-prometheus-grafana/node-exporter.yaml
kubectl create -f  k8s-prometheus-grafana/prometheus/rbac-setup.yaml
kubectl create -f  k8s-prometheus-grafana/prometheus/configmap.yaml
kubectl create -f  k8s-prometheus-grafana/prometheus/prometheus.deploy.yml
kubectl create -f  k8s-prometheus-grafana/prometheus/prometheus.svc.yml
kubectl create -f   k8s-prometheus-grafana/grafana/grafana-deploy.yaml
kubectl create -f   k8s-prometheus-grafana/grafana/grafana-svc.yaml
kubectl create -f   k8s-prometheus-grafana/grafana/grafana-ing.yaml

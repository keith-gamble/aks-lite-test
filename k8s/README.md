# Kubernetes Documentation

## For Local Installation

1. For installation navigate into the right build directory:
   1. For local development: `cd ./k8s/overlays/local`
1. Create the `k3d` cluster, available at localhost port 5080 or 5443 . Port 80 is generally being used by Traefik.

```sh
k3d cluster create localcluster -p "80:80@loadbalancer" -p "443:443@loadbalancer" --agents 2
```

1. Then set the `kubectl` context to the new cluster

```sh
kubectl config use-context k3d-localcluster
```

1. Install `cert-manager` through helm

```sh
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true
```

1. Build and apply (from within the desired overlay directory)

```sh
kustomize build ./k8s/overlays/local | kubectl apply -f -
```

To delete the configuration

```sh
kustomize build ./k8s/overlays/local | kubectl delete -f -
```

To delete the entire cluster

```sh
k3d cluster delete localcluster
```

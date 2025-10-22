#!/bin/bash
# setup-kind-registry.sh
set -e

# Create local registry if not exists
reg_name='local-registry'
reg_port='5000'
if [ "$(docker ps -aq -f name=$reg_name)" ]; then
  echo "Registry already exists."
else
  docker run -d -p ${reg_port}:5000 --restart=always --name ${reg_name} registry:2
fi

# Create kind cluster with registry mirror
cat <<EOF | kind create cluster --name local-aks --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
containerdConfigPatches:
- |-
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:${reg_port}"]
    endpoint = ["http://${reg_name}:${reg_port}"]
EOF

# Connect registry to kind network
docker network connect "kind" "${reg_name}" || true

echo " Kind cluster and local registry ready!"


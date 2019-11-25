#!/bin/bash

helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.9/deploy/manifests/00-crds.yaml

kubectl create namespace cert-manager

kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true

helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install \
  --name cert-manager \
  --namespace cert-manager \
  --version v0.9.1 \
  jetstack/cert-manager


helm install rancher-stable/rancher \
  --name rancher \
  --namespace cattle-system \
  --set hostname=rancher.my.org

kubectl create namespace cattle-system

helm install \
  rancher \
  --namespace cattle-system \
  --set hostname=rancher.cubical.se rancher-stable/rancher


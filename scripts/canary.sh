#!/usr/bin/env bash

set -e

echo "Deploying sampleapp v2 canary"

kubectl apply -f manifests/v2-canary.yml

kubectl rollout status deploy/sampleapp-v2

read -p "Waiting to switch to green deployment..."

kubectl scale --replicas=3 deployment/sampleapp-v2
kubectl scale --replicas=0 deployment/sampleapp

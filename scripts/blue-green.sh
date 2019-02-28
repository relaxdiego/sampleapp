#!/usr/bin/env bash

set -e

echo "Staging sampleapp v2"

kubectl apply -f manifests/v2-green.yml

kubectl rollout status deploy/sampleapp-v2

read -p "Waiting to switch to green deployment..."

kubectl apply -f manifests/service-green.yml

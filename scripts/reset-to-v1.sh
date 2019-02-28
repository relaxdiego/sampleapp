#!/usr/bin/env bash

set -e

echo "Resetting deployment to v1"

kubectl apply -f manifests/v1.yml
kubectl delete -f manifests/v2-green.yml || echo
kubectl delete -f manifests/v2-canary.yml || echo

kubectl rollout status deploy/sampleapp

echo "Sample app succesfully reset to v1"

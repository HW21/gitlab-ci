#!/usr/bin/env bash

# Create Kube-side secret from config file 
source $HW21_SECRETS_FILE 
sed "s/HW21_GITLAB_RUNNER_TOKEN/'${HW21_GITLAB_RUNNER_TOKEN}'/" config.tmpl.toml > config.toml
kubectl delete secret hw21-gitlab-runner-config
kubectl create secret generic hw21-gitlab-runner-config --from-file=config.toml 


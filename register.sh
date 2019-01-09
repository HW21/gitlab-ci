#!/usr/bin/env bash

# GitLab CI Runner Registration 
#  Run (hopefully) just once, from MacBook

source $HW21_SECRETS_FILE 
mkdir -p config/ 
docker run --rm -t -i -v `pwd`/config:/etc/gitlab-runner \
  --name hw21-kube-gitlab-runner \
  gitlab/gitlab-runner register \
  --non-interactive \
  --executor "kubernetes" \
  --docker-image alpine:latest \
  --url "https://gitlab.com/" \
  --registration-token "$HW21_GITLAB_REG_TOKEN" \
  --description "hw21-kube-gitlab-runner" \
  --tag-list "hw21,kube,kubernetes,gcp" \
  --run-untagged \
  --locked="false"


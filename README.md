# docker-gitlab-ci-sample Overview

push to Gitlab, and build docker and push to private docker registry by Gitlab-CI.

## Require
* Gitlab -> CI/CD Settings -> Secret variables
    * Set `DOCKER_USER` : login id for docker registory
    * Set `DOCKER_PASS` : login pass for docker registory

## Pipeline

### master branch
* docker login --username=$DOCKER_USER --password=$DOCKER_PASS $DOCKER_REGISTRY
* docker build -t $DOCKER_REGISTRY/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME .
* docker push $DOCKER_REGISTRY/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME

### not master branch
* docker login --username=$DOCKER_USER --password=$DOCKER_PASS $DOCKER_REGISTRY
* docker build -t $DOCKER_REGISTRY/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME:$CI_COMMIT_REF_NAME .
* docker push $DOCKER_REGISTRY/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME:$CI_COMMIT_REF_NAME

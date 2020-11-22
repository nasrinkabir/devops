#!/bin/bash

[ ! -d  `pwd`/nodejs-helm-chart/ ] && { echo "Please change to git repo\'s devops\\ dir" ; exit; } 

RELEASE_NAME="prodnodejsapp"
NAMESPACE="prod"

# Delete RELEASE

sudo helm delete $RELEASE_NAME --namespace $NAMESPACE

sleep 60

# Upgrade  RELEASE 

sudo helm install $RELEASE_NAME  --set image.tag="prod"  --set service.exposePort=30000 --set mysql.mysqlDatabase="prodDatabase" --set mysql.existingSecret="prod-db-cred" --namespace $NAMESPACE --create-namespace nodejs-helm-chart/


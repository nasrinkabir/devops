#!/bin/bash

[ ! -d  `pwd`/nodejs-helm-chart/ ] && { echo "Please change to git repo\'s devops\\ dir" ; exit; } 

RELEASE_NAME="devnodejsapp"
NAMESPACE="dev"

# Delete RELEASE

sudo helm delete $RELEASE_NAME --namespace $NAMESPACE

sleep 60

# Upgrade RELEASE 

sudo helm upgrade --install $RELEASE_NAME --set image.tag="dev" --set mysql.mysqlDatabase="devDatabase" --set mysql.existingSecret="dev-db-cred" --namespace $NAMESPACE --create-namespace nodejs-helm-chart/



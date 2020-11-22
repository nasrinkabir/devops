#!/bin/bash

[ ! -d  `pwd`/nodejs-helm-chart/ ] && { echo "Please change to git repo\'s devops\\ dir" ; exit; } 

read -p "Generate password for Mysql root: " root_pass
read -p "Generate password for Mysql db user: " user_pass

echo -n "$user_pass" > mysql-password
echo -n "$root_pass" > mysql-root-password


# Create prod namespace

sudo kubectl create namespace prod


# generate secrets for MySQL

sudo kubectl create secret generic prod-db-cred --from-file=./mysql-root-password --from-file=./mysql-password --namespace prod


# Deploy RELEASE using helm template for Production environment.

sudo helm install prodnodejsapp  --set image.tag="prod"  --set service.exposePort=30000 --set mysql.mysqlDatabase="prodDatabase" --set mysql.existingSecret="prod-db-cred" --namespace prod --create-namespace nodejs-helm-chart/


#remove generated password files.
rm -f mysql-password mysql-root-password


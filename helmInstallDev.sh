#!/bin/bash

[ ! -d  `pwd`/nodejs-helm-chart/ ] && { echo "Please change to git repo\'s devops\\ dir" ; exit; } 

read -p "Generate password for Mysql root: " root_pass
read -p "Generate password for Mysql db user: " user_pass

echo -n "$user_pass" > mysql-password
echo -n "$root_pass" > mysql-root-password


# Create dev namespace

sudo kubectl create namespace dev


# generate secrets for MySQL 
sudo kubectl create secret generic dev-db-cred --from-file=./mysql-root-password --from-file=./mysql-password --namespace dev


# Deploy RELEASE using helm template for Development environment.

sudo helm install devnodejsapp --set image.tag="dev" --set service.exposePort=30001 --set mysql.mysqlDatabase="devDatabase" --set mysql.existingSecret="dev-db-cred" --namespace dev --create-namespace nodejs-helm-chart/

#remove generated password files.

rm -f mysql-password mysql-root-password


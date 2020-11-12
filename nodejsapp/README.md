# private

* Prerequisite
	. Docker
	. nodejs
	. Minikube
	. Kubectl
	. Helm
   (Refer installation_instruction.txt for installing above softwares on Ubuntu 18.04)



sudo docker build -t my-mysql .


sudo docker run  -d --env MYSQL_ROOT_PASSWORD='password' --name=my-mysql-microservice my-mysql


docker build -t my-nodejs .


sudo docker run  -d \
--publish 4001:4000 \
-e MYSQL_USER='root' \
-e MYSQL_PASSWORD='password' \
-e MYSQL_DATABASE='helloworld' \
-e MYSQL_HOST='172.17.0.4' \
--link my-mysql-microservice:db \
--name=my-nodejs-microservice my-nodejs

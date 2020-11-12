# private

* Prerequisite
	. Docker
	. nodejs
	. Minikube
	. Kubectl
	. Helm
	. enable ingress in kubectl
   (Refer installation_instruction.txt for installing above tools on Ubuntu 18.04)


* Checkout git repo
	git clone https://github.com/nasrinkabir/devops.git


* build your image
	cd devops/nodejsapp/nodejsimage/
	sudo docker build -t test/my-nodejs . 

* Generate secrets for mysql
      Ex: 
	echo -n "passw0rd" > mysql-password
	echo -n "rootpassw0rd" > mysql-root-password
	sudo kubectl create secret generic api-db-pass --from-file=./mysql-root-password --from-file=./mysql-password



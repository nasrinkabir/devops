# private

* Prerequisite
	. Docker
	. nodejs
	. Minikube
	. Kubectl
	. Helm
	. enable ingress in kubectl
   (Refer installation_instruction.txt for installing above tools on Ubuntu 18.04)


* Checkout git repo:

	git clone https://github.com/nasrinkabir/devops.git


* build your image:

	cd devops/nodejsapp/nodejsimage/
	sudo docker build -t test/my-nodejs . 

* Generate secrets for mysql:

     By echoing the password you want in respective files and generate secrets: 
	echo -n "ChooseYourPassword" > mysql-password
	echo -n "ChooseYourRootPassword" > mysql-root-password
	sudo kubectl create secret generic api-db-pass --from-file=./mysql-root-password --from-file=./mysql-password

* Install helm chart:

	cd devops/nodejsapp/
	sudo helm install <RELEASE_NAME>  helm-chart/

	

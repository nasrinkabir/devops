* Prerequisite <br/><br/>
      . Docker <br/>
      . nodejs <br/>
      . Minikube<br/>
      . Kubectl <br/>
      . Helm <br/>
      . enable ingress in kubectl<br/>
	  (Refer installation_instruction for installing above tools on Ubuntu 18.04)<br/>
<br/>
<br/>

* Checkout git repo:<br/>
<br/>
     git clone https://github.com/nasrinkabir/devops.git<br/>
<br/>
<br/>

* build your image:<br/>
<br/>
     cd devops/nodejsapp/nodejsimage/<br/>
     sudo docker build -t test/my-nodejs . <br/>
</br>
* Generate secrets for mysql:<br/>
<br/>
   By echoing the password you want in respective files and generate secrets: <br/>
     echo -n "ChooseYourPassword" > mysql-password<br/>
     echo -n "ChooseYourRootPassword" > mysql-root-password<br/>
     sudo kubectl create secret generic api-db-pass --from-file=./mysql-root-password --from-file=./mysql-password<br/>
<br/>
* Install helm chart:<br/>
<br/> RELEASE_NAME : provide a name for this app release.<br/>
     cd devops/nodejsapp/<br/>
     sudo helm install RELEASE_NAME  helm-chart/<br/>
<br/>
*You will be able to browse the result at HOST_IP:30000

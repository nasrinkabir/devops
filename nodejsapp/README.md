
* Prerequisite <br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;. Docker <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;. nodejs <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;. Minikube<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;. Kubectl <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;. Helm <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;. enable ingress in kubectl<br/>
&nbsp;&nbsp;&nbsp;&nbsp;(Refer installation_instruction for installing above tools on Ubuntu 18.04)<br/>
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

* Generate secrets for mysql:<br/>
<br/>
     By echoing the password you want in respective files and generate secrets: <br/>
        echo -n "ChooseYourPassword" > mysql-password<br/>
        echo -n "ChooseYourRootPassword" > mysql-root-password<br/>
        sudo kubectl create secret generic api-db-pass --from-file=./mysql-root-password --from-file=./mysql-password<br/>
<br/>
* Install helm chart:<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd devops/nodejsapp/<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sudo helm install <RELEASE_NAME>  helm-chart/<br/>

	

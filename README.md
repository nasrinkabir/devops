# Prerequisite 
	- Docker 
	- Minikube
	- Kubectl
	- Helm
	- Enable ingress in kubectl
(Use devops/installation_instruction for installing above tools on Ubuntu 18.04)


## Checkout git repo:

```
git clone https://github.com/nasrinkabir/devops.git
```

## To deploy application in producton environment use below script:
```
./helmInstallProd.sh
```
	- This script will create a kubernetes namespace prod
	- Create secrets for prod MySQL database
	- Deployes Release prodnodejsapp in the namespace prod
	- Prod applicatipn can be accessed at IP:30000

## To deploy application in development environment use below script:
```
./helmInstallDev.sh
```
	- This script will create a kubernetes namespace dev
	- Create secrets for dev MySQL database
	- Deployes Release devnodejsapp in the namespace prod
	- Dev applicatipn can be accessed at IP:30001

## To Upgrade application in producton environment use below script:
```
./helmUpgradeProd.sh
```
	- Script reinstalls the helm RELEASE, hence re-pulling image
## To Upgrade application in dev environment use below script:
```
./helmUpgradeDev.sh
```
	- Script reinstalls the helm RELEASE, hence re-pulling image


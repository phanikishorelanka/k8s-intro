#Generate ssh key pairs
ssh-keygen -t rsa -b 2048 -f c:\Users\<username>\.ssh\key1.pub

#New ssh session to a minikube running on azure
ssh rlevchenko@<pip>-i c:\Users\<username>\.ssh\key.pub

#Upgrade the packages
sudo apt-get update #retrieve new list of packages
sudo apt-get upgrade #perform an upgrade
sudo apt-get dist-upgrade #distribution upgrage (resolves any conflicts)

#Install the virtualbox on ubuntu
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install dkms
sudo apt-get install virtualbox-6.0
sudo usermod -a -G vboxusers `whoami` #add a current user to vboxusers

#Install the latest minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
chmod +x minikube
sudo mv minikube /usr/local/bin/

#Install the kubectl 1.16
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version

#Check config and cluster
kubectl config view
kubectl cluster-info

#APIs through the proxy
kubectl proxy
curl http://127.0.0.1:8001
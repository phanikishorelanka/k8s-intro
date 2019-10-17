#Generate ssh key pairs
ssh-keygen -t rsa -b 2048 -f c:\Users\<username>\.ssh\key1.pub

#New ssh session to a minikube running on azure
ssh rlevchenko@<pip> -i c:\Users\<username>\.ssh\key.pub

#Upgrade the packages
sudo apt-get update #retrieve new list of packages
sudo apt-get upgrade #perform an upgrade
sudo apt-get dist-upgrade #distribution upgrage (resolves any conflicts)


#Initiate a new ssh session
minikube ssh

#Make a new dir for our storage
mkdir pod-volume
cd pod-volume

#Get a current dir
pwd

#Create a pod
kubectl create -f pod-volume/podWithStor.yaml
kubectl get pods
kubectl expose pod nginx-pod --type=NodePort --port=80 #expose the pod
minikube service nginx-pod #open the service in the browser
kubectl delete pod nginx-pod
kubectl get pods #no longer see the pod
kubect get services,endpoints #service is still running (no endpoint)
kubectl create -f podWithStor2.yaml #pod with the same volume
minikube service nginx-pod #same index should be shown
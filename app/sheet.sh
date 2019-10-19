#List the deployments
kubectl get deployments

#List the ReplicaSets
kubectl get replicasets

#List the PODs
kubectl get pods

#Get more details about the POD (labels, ns and etc)
kubectl describe pod <PODs name>

#Get the PODs belong to the same label
kubectl get pods -L <label>
kubectl get pods -l k8s-app=webserver #example

#Delete the deployment
kubectl delete deployments webserver
kubectl get replicasets #no records
kubectl get pods #no records

#Create a new deployment
kubectl create -f webserver.yaml
kubectl get replicasets

#Create a Service object to expose the deployment
kubectl expose deployment webserver --name=web-service --type=NodePort
kubectl get services
kubectl describe service web-service

#Liveness
kubectl create -f liveness.yaml
kubectl descride pod liveness-exec #check the Liveness status, pod will be restarted automatically
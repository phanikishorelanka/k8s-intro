#Create a new deployment
kubectl create deployment mynginx --image=nginx:1.15-alpine

#Get the lisf of added objects (replicasets, pods, deployments)
kubectl get deploy,rs,po

#Scale the deployment
kubectl scale deploy mynginx --replicas=3

#Check the rollout history
kubectl rollout history deploy mynginx

#Change the deployment image
kubectl set image deployment mynginx nginx=nginx:1.16-alpine

#Apply the rollout
kubectl rollout undo deployment mynginx --to-revision=1 

#Check the history (result: +1 replica set, +1 revision)
kubectl rollout history deploy mynginx
kubectl get deploy,rs,po


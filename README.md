# Kubernetes Introduction Course (my notes)

This repo can be used as a source code of the Introduction to Kubernetes course

Prerequisites: k8s or minikube (or AKS/EKS), kubectl, ubuntu

- pod.yaml - sample of pod configuration
- cheetsheet.sh - cheat sheet with kubectl/minikube commands
- deployments. sh - deployments and update/rollout commands
- ingress.yaml - fanout and virtual host ingress samples
- persstor.sh - commands to create a pod with pers.storage
- podWithStor.yaml - creates a pod to show pers.storage in action
- podWithStor2.yaml - create a second pod to show pers.storage in action
- aaa.sh - rbac/roles/rolesbinding commands
- app | liveness.yaml - pod configuration with a liveness probe (tcp/http/cmd)
- app | readiness.yaml - pod configuration with a readiness probe
- app | sheet.sh - kubectl command to interact with pods/services/deployments
- app | webserver.yaml - pod configuration sample

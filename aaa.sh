#Start your minikube with enabled RBAC if necessary
minikube start --extra-config=apiserver.Authorization.Mode=RBAC
kubectl api-versions

#Get the k8s config's content
kubectl config view

#Create a new namespace
kubectl create namespace demo

#Make a new directory to store certs
mkdir rbac
cd rbac/

#Create a cert
openssl genrsa -out rl.key 2048
openssl req -new -key rl.key -out rl.csr -subj "/CN=rl/O=demo" 
cat rl.csr | base64 | tr -d '\n'
nano signing-request.yaml

/# Cert request
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: rl-csr
spec:
  groups:
  - system:authenticated
  request: <assign encoded value from next cat command>
  usages:
  - digital signature
  - key encipherment
  - client auth
#/ End of request

#Create a signing object
kubectl create -f signing-request.yaml

#Approve the request
kubectl certificate approve rl-csr

#Get csr
kubectl get csr

#Decode to base64 and saver as crt
kubectl get csr rl-csr -o jsonpath='{.status.certificate}' | base64 --decode > rl.crt
#Set a user with a cert
kubectl config set-credentials rl --client-certificate=rl.crt --client-key=rl.key
kubectl config set-context rl-context --cluster=minikube --namespace=demo --user=rl
kubectl config view

#Verify permissions
kubectl -n demo create deployment nginx --image=nginx:alpine
kubectl --context=rl-context get pods #should generate an error

#Create a role
nano role.yaml

/# Begin
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: demo
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
#/ End

kubectl create -f role.yaml
kubectl -n demo get roles

#Bind the role to user
nano rolebinding.yaml

/# Begin
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-read-access
  namespace: demo
subjects:
- kind: User
  name: rl
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
#/ End

kubectl create -f rolebinding.yaml
kubectl -n demo get rolebindings

#Verification
kubectl --context=rl-context get pods
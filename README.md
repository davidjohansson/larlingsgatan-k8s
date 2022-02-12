# Kubernetes setup

1. klustret heter larlingsgatan
2. installerat på fuchsia i k3s


# create k3s group and add user to avoid using always sudo
sudo groupadd k3s
sudo usermod -aG k3s $USER
sudo chown root:k3s /etc/rancher/k3s/k3s.yaml
sudo chmod 740 /etc/rancher/k3s/k3s.yaml

## Installera
kubectl apply -f namespace.yml

mock-telldus/create-secret.sh
kubectl apply -f mock-telldus/deployment.yml
kubectl apply -f mock-telldus/servic-cluster-ip.yml

minikube addons enable ingress
kubectl apply -f ingress.yml 
kubectl apply -f ig-class.yml 



# Köra
Man måste köra det här kommandot för att lastbalanserare skall funka:
minikube tunnel

## Deployments

## Secrets
För att hämta images från aws måste man ha rätt secret, detta confas i deployment.yaml. Secreten verkar ha en viss livslängd (ett dygn?) så den måste förnyas med jämna mellanrum.

`kubectl -n larlingsgatan get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode`

`kubectl delete secret regcred -n larlingsgatan`
 
`./create-secret.sh`

TODO: 
- 20210130: Få k9s att funka från laptopen mot klustret. En .config.yaml kommer troligen behövas. Kan den genereras någonstans ifrån, som från Rancher?
- Automatiskt förnya secrceten mot aws.

LOG:
- 20220211: testar att köra k3s (https://k3s.io/) istället som verkar vara en mer lättviktig distribution av k8s.




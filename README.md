# Kubernetes setup

1. klustret heter larlingsgatan
2. installerat på fuchsia i minikube

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
För att hämta images från aws måste man ha rätt secret, detta confas i deployment.yaml. Secreten verkar ha en viss livslängd så den måste förnyas med jämna mellanrum.

`kubectl -n larlingsgatan get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode`

`kubectl delete secret regcred -n larlingsgatan`
 
`./create-secret.sh`

TODO: 
- 20210130: Få k9s att funka från laptopen mot klustret. En .config.yaml kommer troligen behövas. Kan den genereras någonstans ifrån, som från Rancher?
- 20210130: minikube startar igen efter reboot
- 20220211: testar att köra k3s (https://k3s.io/) istället som verkar vara en mer lättviktig distribution av k8s.




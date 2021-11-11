# Kubernetes setup

1. klustret heter larlingsgatan
2. installerat på fuchsia i minikube

## Installera

### Ingress
Man måste installera en ingresscontroller, i minikube görs det genom
minikube addons enable ingress

kubectl apply -f ingress.yml -n larlingsgatan
kubectl apply -f ig-class.yml -n larlingsgatan


## Deployments
./create-secret.sh
kubectl apply -f deployment.yaml -n larlingsgatan

## Service
kubectl apply -f service-cluster-ip.yml -n larlingsgatan


#Köra
Man måste köra det här kommandot för att lastbalanserare skall funka:
minikube tunnel

## Deployments

## Secrets
För att hämta images från aws måste man ha rätt secret, detta confas i deployment.yaml. Secreten verkar ha en viss livslängd så den måste förnyas med jämna mellanrum.

`kubectl -n larlingsgatan get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode`

`kubectl delete secret regcred -n larlingsgatan`
 
`./create-secret.sh`




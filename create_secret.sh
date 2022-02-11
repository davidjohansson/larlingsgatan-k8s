kubectl create secret docker-registry regcred \
  --docker-server=136497237762.dkr.ecr.eu-north-1.amazonaws.com/ \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password) \
  --namespace=larlingsgatan

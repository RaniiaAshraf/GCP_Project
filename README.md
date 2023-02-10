# GCP_Project
## ***Infrastructure used Terraform***
- One VPC
- Two Subntes   
    - Management , restricted
- Private Vm
- Loadbalancer
- Service account 
- GKE

## Dockerfile 
```
FROM python:3.9

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "hello.py" ]

```

## Build dockerfile

```
sudo docker build -t python-app .
sudo docker tag application gcr.io/rania-project-375711/application
sudo docker push gcr.io/rania-project-375711/application
```
## Pull redis image

```
 sudo docker pull redis
 sudo docker tag redis gcr.io/rania-project-375711/redis
 sudo docker push gcr.io/rania-project-375711/redis
```

## .yml files

- redis-service.yaml
  <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/redis-service.png" width="600" height="400" > 
  </div>
  
- redis-deployment.yaml
  <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/redis-deployment.png" width="600" height="400" > 
  </div>
  
- configMap.yaml
  <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/configMap.yaml.png" width="600" height="400" > 
  </div>
  
- deployment.yaml
  <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/deployment.yaml.png" width="600" height="400" > 
  </div>
  
- load-balancer-service.yaml
   <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/load-balancer-service.png" width="600" height="400" > 
  </div>

### Steps

1. Connect ssh to private Vm 
2. Take cluster connect link paste it in ssh window 
3. Apply yaml files 
```
kubectl apply -f [yml files]
kubectl get all
```
 <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/ssh.png" width="600" height="400" > 
  </div>
  
4. Take ip from loadbalancer

  <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/loadbalancer.png" width="400" height="200" > 
  </div>
  
6. Paste it in the browser
  
  <div>
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/output.png" width="600" height="400" >
  <img src="https://github.com/RaniiaAshraf/GCP_Project/blob/main/pics/finaloutput.png" width="600" height="400" > 
  </div>
  

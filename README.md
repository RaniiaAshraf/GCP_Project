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


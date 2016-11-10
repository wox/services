# Demo: Microservices / Traefik / Docker Swarm / Docker-in-Docker

Create a local Docker cluster using Docker-in-Docker
```
cluster_up.sh
```

Deploy a Docker Swarm in the cluster
```
swarm_up.sh
```
  
Deploy a Treafik proxy and some test services in the Swarm
```
services_up.sh
```

Open the test application @ localhost and watch what happens when scaling a backend service
```
docker-compose -H :4000 -p demo -f services.yml scale service1_backend=2 
```

* Test app @ localhost
* Services @ localhost/api/service1 && localhost/api/service2
* Consul @ localhost:8500
* Traefik @ localhost:8080

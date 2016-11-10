#!/bin/bash

alias de='docker-compose -p hosts -f hosts.yml exec'

de consul0 docker run -d -p 8500:8500 --name=consul progrium/consul -server -bootstrap

de manager0 docker run -d --name=manager -p 4000:4000 -v /:/host swarm manage -H :4000 --replication --advertise 172.20.0.3:4000 consul://172.20.0.2:8500

de manager1 docker run -d --name=manager -p 4000:4000 -v /:/host swarm manage -H :4000 --replication --advertise 172.20.0.4:4000 consul://172.20.0.2:8500

de node0 docker run -d --name=node swarm join --advertise=172.20.0.5:2375 consul://172.20.0.2:8500

de node1 docker run -d --name=node swarm join --advertise=172.20.0.6:2375 consul://172.20.0.2:8500
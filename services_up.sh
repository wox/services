#!/bin/bash

docker-compose -H :4000 -p demo -f services.yml up -d
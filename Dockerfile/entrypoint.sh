#!/bin/bash

#/opt/ibm/wlp/bin/server start controller && tail -f /logs/messages.log  

# Spustit kolektivní příkaz
echo "joining to collective"
./collective join member1 --host=websphere-liberty-controller --port=9443 --keystorePassword=password123 --user=admin --password=password123 --autoAcceptCertificates

#!/bin/bash

#/opt/ibm/wlp/bin/server start member1

# Spustit kolektivní příkaz
echo "joining to collective"
/opt/ibm/wlp/bin/collective join member1 --host=websphere-liberty-controller --port=9443 --keystorePassword=password123 --user=admin --password=password123 --autoAcceptCertificates

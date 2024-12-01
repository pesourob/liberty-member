#!/bin/bash

if [[ ! -e /opt/ibm/wlp/usr/servers/member1/resources || ! -e /opt/ibm/wlp/usr/servers/member1/collective-join-include.xml ]]; then
    echo "------------joining to collective------------"
   # /opt/ibm/wlp/bin/collective join member1 --host=websphere-liberty-controller --port=9443 --keystorePassword=password123 --user=admin --password=password123 --createConfigFile=/opt/ibm/wlp/usr/servers/member1/ --autoAcceptCertificates
else
    echo "------------Files exist, skipping collective join command------------"
fi

echo "------------Starting server------------"
/opt/ibm/wlp/bin/server start member1 && tail -f /logs/messages.log

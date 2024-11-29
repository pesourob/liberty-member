#!/bin/bash

# Work arround for hostname correction
#sed -i "s/<variable name=\"defaultHostName\" value=\"[^\"]*\" \/>/<variable name=\"defaultHostName\" value=\"$HOSTNAME\" \/>/" /opt/ibm/wlp/usr/servers/controller/collective-create-include.xml

# Join to collective command // !!!HOSTNAME in this case must be use controller hostname !!! Try create configmap or secret
./collective join member1 --host=websphere-liberty-controller --port=9443 --keystorePassword=password123 --user=admin --password=admin123 --autoAcceptCertificates

#./collective join member1 --host=websphere-liberty-controller-0.websphere-liberty-controller.pesourob-was-liberty.svc.cluster.local --port=9443 --keystorePassword=password123 --user=admin --password=password123


# Start the server
/opt/ibm/wlp/bin/server start member1

# Container run 
tail -f /logs/messages.log

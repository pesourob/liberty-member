# Use the base image WebSphere Liberty
FROM websphere-liberty:latest

MAINTAINER robert.pesout@tietoevry.com

USER root

# Set the working directory
WORKDIR /opt/ibm/wlp/bin

#COPY collective-create-include.xml /tmp
COPY entrypoint.sh /tmp

# Install vim and create the server
RUN apt-get update && apt install -y vim && \
    mkdir -p /.ssh && \
    touch /.ssh/authorized_keys && \
    chmod -R o+rwx /.ssh/authorized_keys && \
    chmod -R g+rwx /.ssh/authorized_keys && \ 
    chmod -R u+rwx /.ssh/authorized_keys && \ 
    chown -R 1001:0 /tmp/entrypoint.sh && \
    ./server create member1 && \
    #cp -r /tmp/collective-create-include.xml /opt/ibm/wlp/usr/servers/controller/ && \
    chmod +x /tmp/entrypoint.sh && \
    chmod -R o+rw /opt/ibm/wlp/usr/servers/ && \
    chown -R 1001:0 /tmp/entrypoint.sh && \
    chmod -R u+rwx /tmp/entrypoint.sh && \
    chmod -R g+rw /config && \
    chown -R 1001:0 /logs && \
    chmod -R g+rw /logs && \
    chown -R 1001:0 /opt/ibm/wlp/usr && \
    chmod -R g+rw /opt/ibm/wlp/usr && \
    chmod -R u+rw /opt/ibm/wlp/usr && \
    chown -R 1001:0 /opt/ibm/wlp/output && \
    chmod -R g+rw /opt/ibm/wlp/output && \
    chown -R 1001:0 /etc/wlp && \
    chmod -R g+rw /etc/wlp
    
COPY --chown=1001:0 server.xml /opt/ibm/wlp/usr/servers/member1/

ENTRYPOINT ["/tmp/entrypoint.sh"]

# Start the server
CMD /opt/ibm/wlp/bin/server start member1 && tail -f /logs/messages.log

# Expose necessary ports
EXPOSE 9080 9443

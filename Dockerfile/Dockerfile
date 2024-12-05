# Use the base image WebSphere Liberty
FROM websphere-liberty:latest

MAINTAINER robert.pesout@tietoevry.com

USER root

# Set working directory
WORKDIR /opt/ibm/wlp/bin

# Copy necessary files
COPY entrypoint.sh /tmp

# Install dependencies and configure server
RUN apt-get update && apt-get install -y vim && apt-get install -y openssh-server openssh-client && apt-get install -y iputils-ping telnet net-tools && \ 
    mkdir -p /.ssh && touch /.ssh/authorized_keys && mkdir -p /var/run/sshd && mkdir -p /root/.ssh && chmod 700 /root/.ssh && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    chmod 700 /.ssh && chmod 600 /.ssh/authorized_keys && \
    ./server create member1 && \
    chmod +x /tmp/entrypoint.sh && \
    chown -R 1001:0 /tmp/entrypoint.sh /opt/ibm/wlp/usr /logs /opt/ibm/wlp/output /etc/wlp && \
    chmod -R g+rw /opt/ibm/wlp/usr /logs /opt/ibm/wlp/output /etc/wlp && usermod --shell /bin/bash default && usermod -aG sudo default


COPY --chown=1001:0 server.xml /opt/ibm/wlp/usr/servers/member1/

USER default

# Set entrypoint
ENTRYPOINT ["/tmp/entrypoint.sh"]

# Start the server
#CMD /opt/ibm/wlp/bin/server start member1 && tail -f /logs/messages.log 

# Expose necessary ports
EXPOSE 9080 9443 22 2222

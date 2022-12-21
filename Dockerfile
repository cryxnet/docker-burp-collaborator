# Using Ubuntu as Docker Image
FROM debian:latest as base

# Identify the maintainer of an image
LABEL maintainer="cryxnet"

# Copy burp folder to /opt/
COPY burp/ /opt/burp

# Creating new group && new user && adding permission 
RUN groupadd -r burpsuite && useradd -r -g burpsuite collaborator && chown -R collaborator /opt/burp/

# Base installation
RUN apt-get update 
RUN apt-get install openjdk-17-jdk
RUN apt-get install openjdk-17-jre

# Setup Container
FROM base as builder

# Set temp Workdir for installation
WORKDIR /tmp/

# Install required packages for building process
RUN apt install -y git wget

# Prepare BurpSuite Pro
RUN wget "https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.12.4&type=Jar" -O /tmp/burp.jar

# Installation Cleanup
RUN apt-get autoremove && apt-get clean && /bin/rm -rf /var/lib/apt/lists/*

# Prepare Configuration File
RUN sed -i "s/SERVER_DOMAIN_PLACEHOLDER/$SERVER_DOMAIN/" /opt/burp/configuration/burp.config

# Setup and deploy 
From base as final

# Deploy BurpSuite Pro
COPY --from=builder /tmp/burp.jar /opt/burp/pkg/burp.jar
COPY --from=builder /opt/burp/configuration/burp.config /opt/burp/configuration/burp.config

# This is the build stage label for production
From final as production

# Set WORKDIR
WORKDIR /opt/burp/

# Set USER
USER collaborator

# Docker Entrypoint
# ENTRYPOINT ["/opt/burp/scripts/entrypoint.sh"]
CMD ["bash"]